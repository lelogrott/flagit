Gem::Specification.new do |s|
  s.name        = 'flagit'
  s.version     = '0.0.6'
  s.date        = '2019-03-20'
  s.summary     = "Flagit!"
  s.description = "Flag it. Flag your commit. Share your knowledge and progress, bit by bit."
  s.authors     = ["Aurelio Grott Neto"]
  s.email       = 'grott.aurelio@gmail.com'
  s.homepage    =
    'http://rubygems.org/gems/flagit'
  s.license       = 'MIT'
  s.add_dependency 'git', '~> 1.5'
  s.add_dependency 'logger', '~> 1.3'

  s.files        = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md", "*.yml", ".rdoc_options", "test/*.rb", "Rakefile"]
  s.require_path = 'lib'
  s.executables = ["flagit"]
  s.license = 'AGPLv3'
  s.metadata = {
    "source_code_uri"   => "https://github.com/lelogrott/flagit"
  }
end
