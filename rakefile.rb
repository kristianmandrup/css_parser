begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "css_parser"
    gem.summary = %Q{CSS parser}
    gem.description = %Q{Lets you parse a CSS file and operate on selectors and calculate specificity etc.}
    gem.email = "kmandrup@gmail.com"
    gem.homepage = "http://github.com/kristianmandrup/load-me"
    gem.authors = ["Kristian Mandrup"]
    # gem.add_development_dependency "rspec", ">= 2.0.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
    
    # add more gem options here    
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
