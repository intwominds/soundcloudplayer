class PlaylistsController < ApplicationController

  def add # add icons link to this action.
    # finds the playlist that was assigned to your account when signed up (create function within accounts_controller), and assigns the playlist to @stash.
    @stash = Playlist.find(@current_account.id)
    # creates a new track db entry from the track.id, which is interpolated and sent from the search.html.erb view via params[:id] & associates the playlist from @stash.id.
    t = Track.create(
      :soundcloud_track_id => params[:id],
      :playlist_id => @stash.id
    )
    # raise 'test'
    redirect_to(:back)
  end

  def show
    # Create a client object with your app credentials.
    client = Soundcloud.new(:client_id => 'ad246bea735d1371bb0416e34ec114a1')
    page_size = 50 #set page size limiting search results.
    ids = @current_account.playlists.first.tracks.map { |t| t.soundcloud_track_id }
    @tracks = client.get('/tracks?ids=' + ids.join(','))
  render '/pages/search'
  end

end
