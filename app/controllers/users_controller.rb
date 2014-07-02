class UserController < ApplicationController
  before_action :check_if_logged_in, :except => [:new, :create]

  def new
    @users = User.all
  end

  def create
    @user = User.new user_params
    @user.username.downcase!
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :avatar, :password, :password_confirmation)
  end

  def check_if_logged_in
    redirect_to(new_user_path) if @current_user.nil?
  end
end
