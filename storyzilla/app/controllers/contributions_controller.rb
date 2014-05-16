class ContributionsController < ApplicationController

  def index 
    @stories = Story.incomplete_stories
  end

  def new
    @prior_contrib = Contribution.find(params[:contribution_id])
    @contribution = Contribution.new
    @contribution.contribution_id = @prior_contrib.id
    
  end

  def create
    @contribution = Contribution.new(contribution_params)
    @prior_contrib = Contribution.find(@contribution.contribution_id)
    @contribution.story = @prior_contrib.story

    if @contribution.save
      flash[:success] = "Contribution successfully created!"
      redirect_to contributions_path
    else
      flash[:failure] = "Contribution was not created."
      render :new
    end
  end

  private
    def contribution_params
      params.require(:contribution).permit(:body, :contribution_id)
    end
end
