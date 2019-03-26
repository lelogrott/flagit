class Flagit::Configuration
  attr_accessor :consumer_key, :consumer_secret, :access_token, :access_token_secret

  def initialize
    @consumer_key = nil
    @consumer_secret = nil
    @access_token = nil
    @access_token_secret = nil
  end
end