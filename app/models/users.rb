# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Users < ActiveRecord::Base
  has_secure_password
  has_many :playlists
  validates :username, :presence => true, :length => { :minimum => 2}
end
