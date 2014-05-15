class User < ActiveRecord::Base
  validates :username, presence: true
  validates :email, presence: true
  # has_many :stories

  has_secure_password
end
