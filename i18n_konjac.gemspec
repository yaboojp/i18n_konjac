$:.push File.expand_path("../lib", __FILE__)

require "i18n_konjac/version"

Gem::Specification.new do |s|
  s.name        = "i18n_konjac"
  s.version     = I18nKonjac::VERSION
  s.authors     = ["yaboojp"]
  s.email       = ["yaboo.ja@gmail.com"]
  s.homepage      = "https://github.com/yaboojp/i18n_konjac"
  s.summary       = %q{Add your ActiveRecord instance method, which is value translated by i18n locale }
  s.description   = <<-DSC
    i18n_konjac
  DSC
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'activerecord', '>= 5.0'
end
