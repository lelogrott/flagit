class Flagit::TwitterOAuth
  require 'oauth'
  require 'json'
  require 'launchy'

  def initialize
    @consumer_key = Flagit.configuration.consumer_key
    @consumer_secret = Flagit.configuration.consumer_secret
    @token = Flagit.configuration.access_token
    @secret = Flagit.configuration.access_token_secret
    @api_version = '1.1'
    @api_host = 'api.twitter.com'
  end

  def run_auth_process
    get_consumer_info if (@consumer_key.nil? || @consumer_secret.nil?)
    return true if authorized?
    request_token = authentication_request_token(oauth_callback: 'oob')
    open_using_browser request_token.authorize_url
    puts 'Enter the supplied PIN:'
    pin = gets.chomp
    access_token = authorize(
      request_token.token,
      request_token.secret,
      oauth_verifier: pin
    )
    puts "#{authorized? ? 'Authorization successful.' : 'Authorization failed.'}"
  end

  def authorize(token, secret, options = {})
    request_token = OAuth::RequestToken.new(
      consumer, token, secret
    )
    @access_token = request_token.get_access_token(options)
    @token = @access_token.token
    @secret = @access_token.secret
    Flagit.configure do |config|
      config.access_token = @token
      config.access_token_secret = @secret
    end
    @access_token
  end

  def authentication_request_token(options={})
    consumer.options[:authorize_path] = '/oauth/authenticate'
    request_token(options)
  end

  def request_token(options={})
    consumer.get_request_token(options)
  end

  def authorized?
    oauth_response = access_token.get("/#{@api_version}/account/verify_credentials.json")
    return oauth_response.class == Net::HTTPOK
  end

  private

  def consumer
    @consumer ||= OAuth::Consumer.new(@consumer_key, @consumer_secret, { site: "https://#{@api_host}" })
  end

  def access_token
    @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
  end

  def get(path, headers={})
    headers.merge!('User-Agent' => 'flagit gem')
    oauth_response = access_token.get("/#{@api_version}#{path}", headers)
    parse(oauth_response.body)
  end

  def post(path, body='', headers={})
    headers.merge!('User-Agent' => 'flagit gem')
    headers.merge!('Content-Type' => "application/x-www-form-urlencoded\r\n")
    oauth_response = access_token.post("/#{@api_version}#{path}", body, headers)
    parse(oauth_response.body)
  end

  def delete(path, headers={})
    headers.merge!('User-Agent' => 'flagit gem')
    oauth_response = access_token.delete("/#{@api_version}#{path}", headers)
    parse(oauth_response.body)
  end

  def parse(response_body)
    JSON.parse(response_body)
    rescue JSON::ParserError => e
      {response: response_body}.to_json
  end

  def open_using_browser(uri)
    Launchy.open(uri) do
      puts "Open: #{uri}"
    end
  end

  def get_consumer_info
    puts 'Enter the Consumer API key:'
    key = gets.chomp
    puts 'Enter the Consumer API secret key:'
    secret = gets.chomp
    Flagit.configure do |config|
      config.consumer_key = key
      config.consumer_secret = secret
    end
    @consumer_key = Flagit.configuration.consumer_key
    @consumer_secret = Flagit.configuration.consumer_secret
  end
end
  