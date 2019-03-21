class Flagit
  def self.hi(path = '.')
    lookout = Lookout.new(path)
    lookout.list_commits
  end
end

require 'flagit/lookout'
