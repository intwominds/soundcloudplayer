class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user

  private
  def authenticate_user
    if session[:account_id].present? # something is not nil, nor an empty string.
      @current_account = Account.where(:id => session[:account_id]).first
    end

    if @current_account.nil?
      session[:account_id] = nil
    end
  end
end
