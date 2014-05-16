class User < ActiveRecord::Base
  VALID_USERNAME_REGEX = /\A[\w\-\.]+\z/i
  validates :username, presence: true, uniqueness: true, format: { with: VALID_USERNAME_REGEX }

  VALID_EMAIL_REGEX = /\A[\w+\-\.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  has_many :stories
  has_many :contributions

  has_secure_password

end
