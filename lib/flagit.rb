class Flagit
  attr_accessor :configuration

  def self.run(message, path = '.')
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
end

require 'flagit/lookout'
require 'flagit/redactor'
require 'flagit/postman'
require 'flagit/twitter_oauth'
require 'flagit/configuration'
