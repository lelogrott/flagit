class Flagit::Configuration
  attr_accessor :consumer_key, :consumer_secret, :access_token, :access_token_secret

  def initialize
    @consumer_key = 'BmxGGcxRqcqlyQoqidW7RIx5Z'
    @consumer_secret = 'E2krk3ikAdGfl3FpR7CeId5i7zvijL0N5daDgS3KopTnJkTUiM'
    @access_token = nil
    @access_token_secret = nil
  end
end