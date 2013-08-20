class UsersController < ApplicationController
  before_action :create_dummy_post
    
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    @posts = @user.posts.page(params[:page]).per(5)
  end
end
