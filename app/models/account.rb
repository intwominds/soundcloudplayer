# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Account < ActiveRecord::Base
  has_secure_password
  validates :username, :presence => true, :length => { :minimum => 2}
end
