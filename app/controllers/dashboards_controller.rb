require "json"
require "open-uri"
require "csv"

class DashboardsController < ApplicationController
  def my_dashboard
    @user = current_user
    @my_hashtags = @user.hashtags
    # byebug_pry
    if params[:name]
      tweets = call_twitter(params[:name])
      unless tweets.class == String
        @score = retrieve_score(split_texts(tweets))
        @hashtag = params[:name]
      end
    end
  end

  private

  TEXTS = []
  def call_twitter(query)

    url = "https://api.twitter.com/2/tweets/search/recent?&query=%23#{query}%20-is%3Aretweet%20%20lang%3Aen&max_results=10"

    # get request
    response = URI.open(url,
      "Authorization" => "Bearer AAAAAAAAAAAAAAAAAAAAAMjvZgEAAAAAzaTwcexM%2FozUoUW4TZjTDl30cpU%3D7oZ6mAazRU6drDRdUPTLllgfeXxKwl9OXwXjWHdyRuxgK23idR").read
    tweets = JSON.parse(response)["data"]
    if tweets.nil?
      redirect_to my_dashboard_path
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
    csv = "lib/assets/Hedonometer.csv"

    # response = File.open(csv)
    scores = []
    words.each {|word|
      CSV.foreach(csv, :headers => :first_row) do |row|
      scores << row["Happiness Score"].to_f if row["Word"] == word
    end
    }
    sum = 0.0
    scores.each { |num|
      sum += num
    }
    sum = (sum / scores.count)
    return sum.round(1)
  end
end

# words.each {|word| CSV.foreach(csv, headers: :first_row) do |row|
