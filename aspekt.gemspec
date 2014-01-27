Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'aspekt'
  s.version     = '1.0.0'
  s.summary     = 'Before, after and around hooks'
  s.description = 'AOP'

  s.required_ruby_version     = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.8.11'

  s.license = 'MIT'

  s.author   = 'Margus Pärt'
  s.email    = 'margus@wave.ee'
  s.homepage = 'http://www.github.com/mxrguspxrt/aspekt'

  s.files = ['README.md', 'examples/**/*', 'lib/**/*']

  s.add_dependency 'bundler',         '>= 1.3.0', '< 2.0'
  s.add_development_dependency 'rspec'
end