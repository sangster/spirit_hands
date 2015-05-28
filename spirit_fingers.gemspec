# -*- encoding: utf-8 -*-

$:.unshift File.expand_path('../lib', __FILE__)
module ::SpiritFingers
  autoload :VERSION, 'spirit_fingers/version'
end

Gem::Specification.new do |gem|
  gem.name          = 'spirit_fingers'
  gem.version       = SpiritFingers::VERSION
  gem.author        = 'Barry Allard'
  gem.email         = 'barry.allard@gmail.com'
  gem.license       = 'MIT'
  gem.homepage      = 'https://github.com/steakknife/spirit_fingers'
  gem.summary       = 'Exercise those fingers. Pry-based enhancements for the default Rails console.'
  gem.description   = "Spending hours in the rails console? Spruce it up and show off those hard-working hands! spirit_fingers replaces IRB with Pry, improves output through awesome_print, and has some other goodies up its sleeves."

  gem.executables   = `git ls-files -z -- bin/*`.split("\0")
    .select { |f| File.executable?(f) }
    .map{ |f| File.basename(f) }
  gem.files         = `git ls-files -z`.split("\0")
  gem.test_files    = `git ls-files -z -- {test,spec,features}/*`.split("\0")

  # Dependencies
  gem.required_ruby_version = '>= 2.0'
  gem.add_runtime_dependency 'pry', '~> 0.10'
  gem.add_runtime_dependency 'pry-rails', '~> 0.3'
  gem.add_runtime_dependency 'pry-doc', '~> 0.6'
  gem.add_runtime_dependency 'pry-git', '~> 0.2'
  gem.add_runtime_dependency 'pry-remote', '~> 0.1'
  gem.add_runtime_dependency 'pry-byebug', '1.3.3'
  gem.add_runtime_dependency 'hirb', '~> 0.7'
  gem.add_runtime_dependency 'hirb-unicode-steakknife', '~> 0.0'
  gem.add_runtime_dependency 'pry-coolline', '~> 0.2'
  gem.add_runtime_dependency 'awesome_print', '~> 1.6'
end
.tap {|gem| pk = File.expand_path(File.join('~/.keys', 'gem-private_key.pem')); gem.signing_key = pk if File.exist? pk; gem.cert_chain = ['gem-public_cert.pem']} # pressed firmly by waxseal
