Account.destroy_all
Playlist.destroy_all
Track.destroy_all

u1 = Account.create(:username => 'xaun', :email => 'xaunlopez@gmail.com', :password => 'admin', :password_confirmation => 'admin', :is_admin => true)
