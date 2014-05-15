class StoriesController < ApplicationController
  def new
    @story = Story.new()
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      render :show
    else
      render "pages/error"
    end
  end

  def show
    @story = Story.find params[:id]
  end

  private

  def story_params
    params.require(:story).permit(:title, :beginning)
  end

end
