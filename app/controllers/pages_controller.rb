class PagesController < ApplicationController

  def search
    # Create a client object with your app credentials.
    client = Soundcloud.new(:client_id => 'ad246bea735d1371bb0416e34ec114a1')
    page_size = 50 #set page size limiting search results.

    # Determines which filter is selected and runs the search.
    if params[:filter] == '/tracks' && params[:search]
      @tracks = client.get(params[:filter], :q => params[:search], :limit => page_size)
      # Checks for which sort_by option is selected within tracks filter, and sorts the results.
      if params[:sort_by_title] == 'ascending'
        @tracks.sort! { |a,b| a.title <=> b.title }
      elsif params[:sort_by_title] == 'descending'
        @tracks.sort! { |a,b| b.title <=> a.title }
      elsif params[:sort_by_duration] == 'ascending'
        @tracks.sort! { |a,b| a.duration <=> b.duration }
      elsif params[:sort_by_duration] == 'descending'
        @tracks.sort! { |a,b| b.duration <=> a.duration }
      elsif params[:sort_by_playback_count] == 'ascending'
        @tracks.sort! { |a,b| a.playback_count <=> b.playback_count }
      elsif params[:sort_by_playback_count] == 'descending'
        @tracks.sort! { |a,b| b.playback_count <=> a.playback_count }
      elsif params[:sort_by_favoritings_count] == 'ascending'
        @tracks.sort! { |a,b| a.favoritings_count <=> b.favoritings_count }
      elsif params[:sort_by_favoritings_count] == 'descending'
        @tracks.sort! { |a,b| b.favoritings_count <=> a.favoritings_count }
      elsif params[:sort_by_created_at] == 'ascending'
        @tracks.sort! { |a,b| a.created_at <=> b.created_at }
      elsif params[:sort_by_created_at] == 'descending'
        @tracks.sort! { |a,b| b.created_at <=> a.created_at }
      elsif params[:sort_by_genre] == 'ascending'
        @tracks.sort! { |a,b| a.genre <=> b.genre }
      elsif params[:sort_by_genre] == 'descending'
        @tracks.sort! { |a,b| b.genre <=> a.genre }
      elsif params[:sort_by_bpm] == 'ascending'
        @tracks.sort! { |a,b| a.bpm <=> b.bpm }
      elsif params[:sort_by_bpm] == 'descending'
        @tracks.sort! { |a,b| b.bpm <=> a.bpm }
      end
    elsif params[:filter] == '/users' && params[:search]
      @users = client.get(params[:filter], :q => params[:search], :limit =>
        page_size)
    elsif params[:filter] == '/playlists' && params[:search]
      @playlists = client.get(params[:filter], :q => params[:search], :limit => page_size)
    else
      @tracks = []
      @users = []
    end
  # raise 'test'
  end

end


