# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'spree_mail_chimp/version'

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name         = 'spree_mail_chimp'
  s.version      = SpreeMailChimp::VERSION.dup
  s.summary      = 'Mail Chimp subscriptions for Spree Commerce.'
  s.description  = s.summary
  s.required_ruby_version = '>= 1.9.3'

  s.author       = 'Sam Beam'
  s.email        = 'sbeam@onsetcorps.net'
  s.homepage     = 'https://github.com/sbeam/spree-mail-chimp'
  s.license      = 'BSD'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = true

  spree_version = '~> 2.0.0'
  s.add_runtime_dependency 'spree_core', spree_version
  s.add_runtime_dependency 'spree_frontend', spree_version
  s.add_runtime_dependency 'spree_backend', spree_version
  s.add_runtime_dependency 'spree_api', spree_version
  s.add_runtime_dependency 'hominid', '~> 3.0.5'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'ffaker', '~> 1.15'
  s.add_development_dependency 'simplecov', '~> 0.7.1'
  s.add_development_dependency 'sqlite3', '~> 1.3.7'
  s.add_development_dependency 'i18n-spec', '~> 0.4'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'fuubar', '>= 1.1.0'
end
