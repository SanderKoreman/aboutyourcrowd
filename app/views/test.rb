require "json"
require "open-uri"


  def call_twitter(query)
  #endpont fetch twits
  url = "https://api.twitter.com/2/tweets/search/recent?&query=#{query}&max_results=100&tweet.fields=lang"
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

  p call_twitter("tesla")
