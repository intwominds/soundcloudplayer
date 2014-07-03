class SessionController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    # raise params.inspect
    account = Account.find_by(:username => params[:username].downcase)
    if account.present? && account.authenticate(params[:password])
      session[:account_id] = account.id # sessions are private hashes
      # raise 'test'
      redirect_to root_path
    else
      flash[:notice] = "Invalid login. Please try again."
      redirect_to login_path
    end
  end

  def destroy
    session[:account_id] = nil
    redirect_to root_path
  end
end
