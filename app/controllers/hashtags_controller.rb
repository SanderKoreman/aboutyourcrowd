class HashtagsController < ApplicationController
  def index
  end

  def show
    @hashtag = Hashtag.find([params[:id]])
  end

  def create

    if params[:hashtag] == Hashtag.find_by(hashtag: params[:hashtag]).hashtag
      update()
      else
      @hashtag = Hashtag.new(hashtag: params[:hashtag], score: params[:score])
      @hashtag.user = current_user
        if @hashtag.save
          redirect_to my_dashboard_path#hashtag_path(@hashtag), notice: 'Hashtag was successfully created.'
          else
          render :new
        end
    end
  end

  def update
    @hashtag = Hashtag.find_by(hashtag: params[:hashtag])
    @hashtag.update(hashtag_params)
    redirect_to my_dashboard_path
  end

  def destroy
    @hashtag = Hashtag.find(params[:id])
    @hashtag.destroy if @hashtag.user == current_user
    redirect_to my_dashboard_path
  end

  private

  def hashtag_params
    params.require(:hashtag).permit(:hashtag, :score)
  end
end
