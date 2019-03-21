# The main Lookout driver
class Flagit::Lookout
  require 'git'
  require 'logger'

  attr_accessor :path, :repository

  def initialize(path = '.')
    @path = path
  end
  
  ##
  # This method gets the prints log of commits from the repository
  #
  # = Example
  #
  #   lookout = Flagit::Lookout.new('foo/bar')
  #   lookout.list_commits
  def list_commits
    @repository = Git.open(@path, log: Logger.new(STDOUT))
    @repository.log
  end
end
