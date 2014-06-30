class PagesController < ApplicationController

  def search
    # create a client object with your app credentials.
    client = Soundcloud.new(:client_id => 'ad246bea735d1371bb0416e34ec114a1')
    page_size = 50 #set page size limiting search results.

    # Determines which filter is selected and runs the search.
    if params[:filter] == '/tracks' && params[:search]
      @tracks = client.get(params[:filter], :q => params[:search], :limit => page_size)
    elsif params[:filter] == '/users' && params[:search]
      @users = client.get(params[:filter], :q => params[:search], :limit =>
        page_size)
    else
      @tracks = []
      @users = []
    end
  # raise 'test'
  end

end


