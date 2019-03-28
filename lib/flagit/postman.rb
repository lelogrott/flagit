class Flagit::Postman
  require 'twitter'
  require 'flagit/twitter_oauth'

  def self.tweet(message)
    auth_client = Flagit::TwitterOAuth.new
    auth_client.run_auth_process
    twitter_rest_client = Twitter::REST::Client.new(
      consumer_key: Flagit.configuration.consumer_key,
      consumer_secret: Flagit.configuration.consumer_secret,
      access_token: Flagit.configuration.access_token,
      access_token_secret: Flagit.configuration.access_token_secret
    )
    twitter_rest_client.update(message)
    puts "Tweeted: #{message}"
    true
  rescue e
    puts e
    false
  end
end
