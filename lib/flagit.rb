class Flagit
  def self.hi(message = 'test', path = '.')
    lookout = Flagit::Lookout.new(path)
    redactor = Flagit::Redactor.new(lookout)
    redactor.write_content(message)
  end
end

require 'flagit/lookout'
require 'flagit/redactor'
