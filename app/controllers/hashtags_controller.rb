class HashtagsController < ApplicationController
  def index

  end

  def show
    @hashtag = Hahstag.find([params[:id]])
    @bookmark = Bookmark.new
  end

  def new
    @hashtag = Hashtag.new
  end

  def create
    @hashtag = Hashtag.new(hashtag_params)
    @hashtag.user = current_user
    if @hashtag.save
      redirect_to hashtag_path(@hashtag), notice: 'Hashtag was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @hashtag = Hashtag.find(params[:id])
    @hashtag.destroy if @hashtag.user == current_user
    redirect_to my_dashboard_path
  end

  private

  def hashtag_params
    params.require(:hashtag).permit(:hashtag)
  end
end
