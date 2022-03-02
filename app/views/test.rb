# require "json"
# require "open-uri"
# require "csv"

#   def call_twitter(query)
#     #endpont fetch twits
#     url = "https://api.twitter.com/2/tweets/search/recent?&query=#{query}&max_results=10&tweet.fields=lang"
#     puts url
#     # get request
#     response = URI.open(url,
#       "Authorization" => "Bearer AAAAAAAAAAAAAAAAAAAAAMjvZgEAAAAAzaTwcexM%2FozUoUW4TZjTDl30cpU%3D7oZ6mAazRU6drDRdUPTLllgfeXxKwl9OXwXjWHdyRuxgK23idR").read
#     # change format, then get specific JSON property
#     tweets = JSON.parse(response)["data"]
#     texts =[]
#     tweets.each do |tweet|
#       texts << tweet["text"] if tweet["lang"] == "en"
#       end
#       # array of strings = twits
#     return texts
#   end

#   def split_texts(tweets)
#     content =[]
#     tweets.each do |tweet|
#       #array of strings
#       content << tweet.split(" ")
#       end
#     return content.flatten
#   end

#   def retrieve_score(words)
#     csv = "lib/assets/hedonometer.csv"

#     # response = File.open(csv)
#     scores =[]
#     words.each {|word| CSV.foreach(csv, headers: :first_row) do |row|
#       scores << row["Happiness Score"].to_i if row["Word"] == word
#     end
#     }
#     sum = 0.0
#     scores.each { |num|
#       sum += num
#     }
#     sum = (sum / scores.count)
#     return sum.round(1)
#   end

# # p retrieve_score(split_texts(call_twitter("christmas")))
# # p call_twitter("christmas")
