class Flagit
  attr_accessor :configuration

  def self.hi(message = 'test', path = '.')
    lookout = Flagit::Lookout.new(path)
    redactor = Flagit::Redactor.new(lookout)
    redactor.write_content(message)
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
