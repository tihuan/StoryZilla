class Story < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :beginning, presence: true
end
