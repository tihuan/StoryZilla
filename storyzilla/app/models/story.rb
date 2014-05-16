class Story < ActiveRecord::Base
  belongs_to :user
  has_many :contributions

  validates :title, presence: true
  validates :beginning, presence: true

  def first_contribution
    return Contribution.where(story_id: self.id, contribution_id: nil).first
  end

  def last_contribution

    # Not DRY - Not sure why I can't call first_contribution
    first_contrib = Contribution.where(story_id: self.id, contribution_id: nil).first

    # CASE: the story has no contributions return nil
    return nil if first_contrib.nil?

    contribs = []
    contribs << first_contrib
    contrib_next = first_contrib.contributions.first

    until contrib_next.nil?
      # puts contribs_next.inspect
      contribs << contrib_next
      contrib_next = contrib_next.contributions.first
    end

    return contribs.last
  end


end
