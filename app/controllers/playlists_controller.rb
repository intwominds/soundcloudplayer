class PlaylistsController < ApplicationController

  def add # add icons link to this action.
    # finds the playlist that was assigned to your account when signed up (create function within accounts_controller), and assigns the playlist to @stash.
    @stash = Playlist.find(@current_account.id)
    # creates a new track db entry from the track.id, which is interpolated and sent from the search.html.erb view via params[:id] & associates the playlist from @stash.id.
    t = Tracks.create(
      :soundcloud_track_id => params[:id],
      :playlist_id => @stash.id
    )
    # raise 'test'
    render '/pages/search'
  end

end
