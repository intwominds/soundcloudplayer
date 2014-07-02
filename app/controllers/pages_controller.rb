class PagesController < ApplicationController

  def search
    # Create a client object with your app credentials.
    client = Soundcloud.new(:client_id => 'ad246bea735d1371bb0416e34ec114a1')
    page_size = 50 #set page size limiting search results.

    # Determines which filter is selected and runs the search.
    if params[:filter] == '/tracks' && params[:search].present?
      @tracks = client.get(params[:filter], :q => params[:search], :limit => page_size)
    elsif params[:filter] == '/users' && params[:search].present?
      @users = client.get(params[:filter], :q => params[:search], :limit =>
        page_size)
    elsif params[:filter] == '/playlists' && params[:search].present?
      @playlists = client.get(params[:filter], :q => params[:search], :limit => page_size)
    else
      @tracks = []
      @users = []
      @playlists = []
    end
  # raise 'test'
  end

  def user
  end

end


