class AccountsController < ApplicationController
  before_action :check_if_logged_in, :except => [:new, :create]
  before_action :check_if_admin, :only => [:index]

  def index
    @accounts = Account.all
  end

  def new # displays form and sends params to post accounts#create.
    @account = Account.new # first argument cannot be empty unless an object, therefore @account is a temporary empty Account.new that does not get saved.

    # raise 'test'
  end

  def create

    @account = Account.new user_params # saves form input into Account.new table & @account variable.
    @account.username.downcase!

    if @account.save # unless @account is not present, it will save to db..
      # create a Playlist with the id of @account, and titles it 'Stash'.
      @stash = Playlist.create(
        :account_id => @account.id,
        :title => 'Stash'
      )
      session[:account_id] = @account.id

      # raise 'test'
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:account).permit(
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end

  def check_if_logged_in
    redirect_to(new_account_path) if @current_account.nil?
  end

  def check_if_admin
    redirect_to(root_path) unless @current_account.is_admin?
  end
end
