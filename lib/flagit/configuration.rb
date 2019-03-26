class Flagit::Configuration
  require 'json'
  attr_accessor :consumer_key, :consumer_secret, :access_token, :access_token_secret

  def initialize
    @consumer_key = nil
    @consumer_secret = nil
    @access_token = nil
    @access_token_secret = nil
  end

  def config_to_json
    {
      consumer_key: consumer_key,
      consumer_secret: consumer_secret,
      access_token: access_token,
      access_token_secret: access_token_secret
    }.to_json
  end
end