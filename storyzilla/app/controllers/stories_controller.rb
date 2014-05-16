class StoriesController < ApplicationController
  before_action :set_story, only: [:show]

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      flash[:success] = "Story successfully created!"
      redirect_to story_path(@story)
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
