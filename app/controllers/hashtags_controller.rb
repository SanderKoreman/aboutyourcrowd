class HashtagsController < ApplicationController
  def index
  end

  def show
    @hashtag = Hashtag.find([params[:id]])
  end

  def create
    @hashtag = Hashtag.new(hashtag: params[:hashtag], score: params[:score])
    @hashtag.user = current_user
    if @hashtag.save
      redirect_to my_dashboard_path#hashtag_path(@hashtag), notice: 'Hashtag was successfully created.'
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
