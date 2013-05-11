require 'twitter'

Twitter.configure do |config|
  config.consumer_key = 'th1Af7IfHEjqT6HsMAgA'
  config.consumer_secret = 'Zu3pvkEkb7R3tJyhnQCjhuzsL75qO1ySFQFc8y6PYqE'
  config.oauth_token = '1212470810-UmPCV9yRJgwQLH3U3bXCkkG3hmY1ykILYcfCwtx'
  config.oauth_token_secret = 'dP86FJneva2gEYdsrGz91aVVAN25sfVUotZIyaFKro'
end


 p Twitter.search('RepToddYoung')