require 'twitter'
require_relative 'models/politician.rb'
require_relative '../db/config.rb'

Twitter.configure do |config|
  config.consumer_key = 'th1Af7IfHEjqT6HsMAgA'
  config.consumer_secret = 'Zu3pvkEkb7R3tJyhnQCjhuzsL75qO1ySFQFc8y6PYqE'
  config.oauth_token = '1212470810-UmPCV9yRJgwQLH3U3bXCkkG3hmY1ykILYcfCwtx'
  config.oauth_token_secret = 'dP86FJneva2gEYdsrGz91aVVAN25sfVUotZIyaFKro'
end

person = Politician.find_by_name('Todd  Young ')
twitter_handle = person.twitter_id
twitter_id = Twitter.user(twitter_handle).id

tweets = Twitter.user_timeline(twitter_id, :count => 10)

tweets.each do |tweet| 
	puts "#{tweet.created_at}: #{tweet.text}"
end

