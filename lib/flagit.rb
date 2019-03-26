class Flagit
  attr_accessor :configuration

  def self.run(message, path = '.')
    load
    lookout = Flagit::Lookout.new(path)
    redactor = Flagit::Redactor.new(lookout)
    Flagit::Postman.tweet(redactor.write_content(message))
  end

  def self.usage
    puts "Usage: flagit \"<message>\" <path_to_repository_directory>"
    puts "Eg: flagit \"Just finished and launched Flagit v1.0.0!\""
    puts "Eg: flagit \"My first gem!\" ~/path/to/repo/dir"
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.save!
    File.open("#{root}/.config.json","w") do |f|
      f.write(configuration.config_to_json)
    end
  end

  def self.load
    return unless File.exist?("#{root}/.config.json")
    loaded = JSON.parse(File.read("#{root}/.config.json"))
    configure do |config|
      config.consumer_key = loaded['consumer_key']
      config.consumer_secret = loaded['consumer_secret']
      config.access_token = loaded['access_token']
      config.access_token_secret = loaded['access_token_secret']
    end
  end

  def self.root
    File.dirname __dir__
  end
end

require 'flagit/lookout'
require 'flagit/redactor'
require 'flagit/postman'
require 'flagit/twitter_oauth'
require 'flagit/configuration'
