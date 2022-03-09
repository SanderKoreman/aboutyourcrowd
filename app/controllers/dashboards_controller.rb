require "json"
require "open-uri"
require "csv"
require "prawn"
require "prawn/table"
require 'wicked_pdf'
# require 'wkhtmltopdf-binary'

class DashboardsController < ApplicationController
  def my_dashboard
    @user = current_user
    @my_hashtags = @user.hashtags
    if params[:name] && params[:name] != ''
      @tweets = ''
      tweets = call_twitter(params[:name])
      unless tweets.class == String
        @score = retrieve_score(split_texts(tweets))
        @sad_words = sad_words(split_texts(tweets))
        @happy_words = happy_words(split_texts(tweets))
        @hashtag = params[:name]
      end
    end

  end

  # def printpdf
  #   @user = current_user
  #   @my_hashtags = @user.hashtags
  #   # raise
  #   respond_to do |format|
  #     format.html #printpdf.html.erb
  #     format.pdf do
  #       pdf = HashtagPdf.new(@my_hashtags)
  #       send_data pdf.render
  #     end
  #   end
  # end


  private

  TEXTS = []
  def call_twitter(query)
    url = "https://api.twitter.com/2/tweets/search/recent?&query=%23#{query}%20-is%3Aretweet%20%20lang%3Aen&max_results=100"
    # get request
    response = URI.open(url,
      "Authorization" => "Bearer AAAAAAAAAAAAAAAAAAAAAMjvZgEAAAAAzaTwcexM%2FozUoUW4TZjTDl30cpU%3D7oZ6mAazRU6drDRdUPTLllgfeXxKwl9OXwXjWHdyRuxgK23idR").read
      # JSON key name for Tweet data array - data
    tweets = JSON.parse(response)["data"]

    if tweets.nil?
      @tweets = false
      redirect_to my_dashboard_path(tweets: @tweets)
    else
      texts = []
      tweets.each do |hash|
        texts << hash["text"]
      end
      # array of strings = tweets
      return texts
    end
  end

  def split_texts(tweets)
    content = []
    tweets.each do |tweet|
      #array of strings
      content << tweet.split(" ").flatten
    end
    return content.flatten
  end

  def retrieve_score(words)
    scores = []
    words.each do |word|
      if ('a'..'z').include?(word[0])
        # table = CSV.table("lib/assets/#{word[0]}.csv")
        csv = "lib/assets/#{word[0]}.csv"
        # selected_by_letter = []
        # wordles << word
        # table.each do |entry|
        #   if entry[:word] == word
        #     scores << entry[:happiness_score]
        #     next
        #   end
        # end
        CSV.foreach(csv, :headers => :first_row) do |row|
          scores << row["Happiness Score"].to_f if row["Word"] == word
        end
      end
    end

    sum = 0.0
      scores.each { |num|
        sum += num
      }
      sum = (sum / scores.count)
      return sum.round(1)
  end

  def happy_words(words)

      happy_words = []
      words.each {|word|
      if ('a'..'z').include?(word[0])
        csv = "lib/assets/#{word[0]}.csv"

        CSV.foreach(csv, headers: :first_row) do |row|
          if (row["Happiness Score"].to_f >= 6) && row["Word"] == word
            happy_words << word
          end
        end
      end
    }

    return happy_words
  end

  def sad_words(words)
      sad_words = []
      words.each {|word|
      if ('a'..'z').include?(word[0])
        csv = "lib/assets/#{word[0]}.csv"

        CSV.foreach(csv, :headers => :first_row) do |row|
          if (row["Happiness Score"].to_f <= 3) && row["Word"] == word
            sad_words << word
          end
        end
      end
    }
    return sad_words
  end

end

# def retrieve_score(words)
#   csv = "lib/assets/Hedonometer.csv"

#   # response = File.open(csv)
#   scores = []
#   words.each { |word|
#     if words.size >= 1000
#       scores = FasterCSV.parse(words.join) rescue next
#     end
#     IO.foreach(csv, :headers => :first_row) do |row|
#       scores << row["Happiness Score"].to_f if row["Word"] == word
#     end
#   }
#   sum = 0.0
#   scores.each { |num|
#     sum += num
#   }
#   sum = (sum / scores.count)
#   return sum.round(1)
# end
