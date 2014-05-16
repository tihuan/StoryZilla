class Contribution < ActiveRecord::Base
  belongs_to :user
  belongs_to :story

  has_many :contributions, class_name: "Contribution"
 
  belongs_to :parent, class_name: "Contribution", foreign_key: "contribution_id"

  validates :body, presence: true

  # def last_contribution

  # end

  def get_contributions
    return Contribution.where(contribution_id: self.id)
  end
end
