class HashtagsController < ApplicationController
  def index
  end

  def show
    @hashtag = Hashtag.find([params[:id]])
  end

  def create

    if Hashtag.find_by(name: params[:name])
      Hashtag.find_by(name: params[:name]).update(score: params[:score])
      redirect_to my_dashboard_path
      else
      @hashtag = Hashtag.new(name: params[:name], score: params[:score])
      @hashtag.user = current_user

        if @hashtag.save
          redirect_to my_dashboard_path#hashtag_path(@name), notice: 'Hashtag was successfully created.'
          else
          render :new
        end
    end
  end

  def update
  end

  def destroy
    @hashtag = Hashtag.find(params[:id])
    @hashtag.destroy if @hashtag.user == current_user
    redirect_to my_dashboard_path
  end

  private

  def hashtag_params
    params.require(:hashtag).permit(:name, :score)
  end
end
