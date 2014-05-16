class Story < ActiveRecord::Base
  belongs_to :user
  has_many :contributions

  validates :title, presence: true
  validates :beginning, presence: true
end
