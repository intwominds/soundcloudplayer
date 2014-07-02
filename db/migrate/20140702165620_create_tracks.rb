class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :playlist_id
      t.integer :soundcloud_track_id

      t.timestamps
    end
  end
end
