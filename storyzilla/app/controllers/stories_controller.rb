class StoriesController < ApplicationController
  before_action :set_story, only: [:show]
  # before_action :signed_in?
  def new
    if not signed_in?
      redirect_to root_path
    else
      @story = current_user.stories.new
    end
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:success] = "Story successfully created!"
      redirect_to @story
    else
      flash[:failure] = "Story was not created."
      render :new
    end
  end

  def show
  end

  private

  def story_params
    params.require(:story).permit(:title, :beginning)
  end

  private

    def set_story
      @story = Story.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "We couldn't find that story."
      redirect_to stories_path
    end

end
