# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_reorder'
  s.version     = '3.0.0'
  s.summary     = 'Simply adds a Reorder button to the Order show view.'
  s.description = 'Simply adds a Reorder button to the Order show view.'
  s.required_ruby_version = '>= 1.9.2'

  s.author    = 'Daniel Dixon'
  s.email     = 'code@danieldixon.com'
  s.homepage  = 'http://www.danieldixon.com'

  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_frontend', '~> 3.0'
end
