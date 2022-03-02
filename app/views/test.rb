require "json"
require "open-uri"
require "csv"

TEXTS = []
  def call_twitter(query)

    #endpoint fetch tweets

    url = "https://api.twitter.com/2/tweets/search/recent?&query=#{query}%20-is%3Aretweet%20%20lang%3Aen&max_results=10"

    # get request
    response = URI.open(url,
      "Authorization" => "Bearer AAAAAAAAAAAAAAAAAAAAAMjvZgEAAAAAzaTwcexM%2FozUoUW4TZjTDl30cpU%3D7oZ6mAazRU6drDRdUPTLllgfeXxKwl9OXwXjWHdyRuxgK23idR").read

      tweets = JSON.parse(response)["data"]
    texts = []
    tweets.each do |hash|
      texts << hash["text"]
    end
    # array of strings = tweets
    return texts
  end

  def split_texts(tweets)
    content = []
    tweets.each do |tweet|
      #array of strings
      tweet.split(" ").flatten!
    end
    return content
  end

  def retrieve_score(words)
    csv = "lib/assets/hedonometer.csv"

    # response = File.open(csv)
    scores = []
    words.each { |word| CSV.foreach(csv, headers: :first_row) do |row|
      scores << row["Happiness Score"].to_i if row["Word"] == word
    end
    }
    sum = 0.0
    scores.each { |num|
      sum += num
    }
    sum = (sum / scores.count)
    return sum.round(1)
  end

puts call_twitter("tesla")
