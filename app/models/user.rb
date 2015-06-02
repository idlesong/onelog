class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  #accepts_nested_attributes_for :posts, :reject_if => lambda { |b| b[:content].blank? }
  #attr_accessible :posts_attributes

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100", :thumbnail => "54x54"},
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true, length: {maximum: 50} , uniqueness: true

  has_secure_password


  def feed
    following_ids = "SELECT followed_id FROM relationships
    WHERE  follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
    OR user_id = :user_id", user_id: id).order(created_at: :desc)
  end

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user
  def following?(other_user)
    following.include?(other_user)
  end
end
