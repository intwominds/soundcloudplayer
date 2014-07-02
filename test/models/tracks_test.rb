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

require 'test_helper'

class TracksTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
