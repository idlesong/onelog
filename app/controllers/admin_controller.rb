class AdminController < ApplicationController
  def index
    @post = Post.new
    @feed_items = current_user.feed
  end
end
