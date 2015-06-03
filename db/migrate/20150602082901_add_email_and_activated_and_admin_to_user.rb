class AddEmailAndActivatedAndAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :activated, :datetime
    add_column :users, :admin, :boolean
  end
end
