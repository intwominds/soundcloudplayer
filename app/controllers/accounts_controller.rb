class AccountsController < ApplicationController
  before_action :check_if_logged_in, :except => [:new, :create]

  def new
    @account = Account.new
    # raise 'test'
  end

  def create
    @account = Account.new user_params
    @account.username.downcase!
    if @account.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:account).permit(:username, :password, :password_confirmation)
  end

  # def check_if_logged_in
  #   redirect_to(new_account_path) if @current_account.nil?
  # end
end
