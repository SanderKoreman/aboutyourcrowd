require "json"
require "open-uri"

class ApplicationController < ActionController::Base
  before_action :authenticate_user!


  def call_twitter(query)
    #endpont fetch twits
    url = "https://api.twitter.com/2/tweets/search/recent?&query=#{query}&max_results=10&tweet.fields=lang"
    puts url
    # get request
    response = URI.open(url,
      "Authorization" => "Bearer AAAAAAAAAAAAAAAAAAAAAMjvZgEAAAAAzaTwcexM%2FozUoUW4TZjTDl30cpU%3D7oZ6mAazRU6drDRdUPTLllgfeXxKwl9OXwXjWHdyRuxgK23idR").read
    tweets = JSON.parse(response)["data"]
    texts = []
      tweets.each do |hash|
          texts << hash["text"] if hash["lang"] == "en"
        end
      # array of strings = twits
    return texts
    end

  def retrieve_score
    # split each String in Array into words => (Array of words)
    # ---- (filtering) ----
    # Array of words.each => look for word in Hedononometer => save the score in an Array of scores (Integer)
    # Make the average (of scores)

    
  end

end
