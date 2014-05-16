class ContributionsController < ApplicationController

  def index 
    @contributions = Contribution.all
  end
end
