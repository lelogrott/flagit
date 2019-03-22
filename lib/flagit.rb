class Flagit
  def self.hi(message = 'test', path = '.')
    redactor = Flagit::Redactor.new(path)
    redactor.write_content(message)
  end
end

require 'flagit/lookout'
require 'flagit/redactor'
