Account.destroy_all
Playlist.destroy_all
Track.destroy_all

u1 = Account.create(:username => 'zim', :password => 'doom', :password_confirmation => 'doom', :is_admin => true)
