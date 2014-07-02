# == Schema Information
#
# Table name: playlists
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  account_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Playlist < ActiveRecord::Base
  belongs_to :account
  has_many :tracks
end
