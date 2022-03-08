class PrintingController < ApplicationController

  def print
    @user = current_user
    @my_hashtags = @user.hashtags
    respond_to do |format|

      format.html
      format.pdf do
        render pdf: "recentsearches", template: "printing/print.html.erb", layout: "pdf.html"
      end
    end
  end

end
