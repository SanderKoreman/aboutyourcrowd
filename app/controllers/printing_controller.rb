class PrintingController < ApplicationController

  def print
    @user = current_user
    @my_hashtags = @user.hashtags
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "recentsearches", template: "printing/print.html.erb", layout: "pdf.html.erb", encoding: "UTF-8"
      end
    end
  end

  def printshow
    @user = current_user
    @hashtag = Hashtag.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "showpage", template: "printing/printshow.html.erb", layout: "pdf.html.erb", encoding: "UTF-8"
      end
    end
  end
end
