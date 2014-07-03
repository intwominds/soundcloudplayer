# == Schema Information
#
# Table name: tracks
#
#  id                  :integer          not null, primary key
#  playlist_id         :integer
#  soundcloud_track_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#

class Track < ActiveRecord::Base
  belongs_to :playlist
end
