# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile.rb, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{css_parser}
  s.version = "1.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kristian Mandrup"]
  s.date = %q{2010-05-19}
  s.description = %q{Lets you parse a CSS file and operate on selectors and calculate specificity etc.}
  s.email = %q{kmandrup@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "CHANGELOG",
     "LICENSE",
     "README.rdoc",
     "VERSION",
     "_rakefile.rb",
     "css_parser.gemspec",
     "lib/css_parser.rb",
     "lib/css_parser/declaration.rb",
     "lib/css_parser/declaration_api.rb",
     "lib/css_parser/declarations.rb",
     "lib/css_parser/parser.rb",
     "lib/css_parser/regexps.rb",
     "lib/css_parser/rule_set.rb",
     "lib/css_parser/selector.rb",
     "lib/css_parser/selectors.rb",
     "rakefile.rb",
     "test/fixtures/import-circular-reference.css",
     "test/fixtures/import-with-media-types.css",
     "test/fixtures/import1.css",
     "test/fixtures/simple.css",
     "test/fixtures/subdir/import2.css",
     "test/test_css_parser_basic.rb",
     "test/test_css_parser_loading.rb",
     "test/test_css_parser_media_types.rb",
     "test/test_css_parser_misc.rb",
     "test/test_css_parser_regexps.rb",
     "test/test_helper.rb",
     "test/test_merging.rb",
     "test/test_parsing.rb",
     "test/test_rule_set.rb",
     "test/test_rule_set_creating_shorthand.rb",
     "test/test_rule_set_expanding_shorthand.rb",
     "test/test_selector.rb",
     "test/test_selector_parsing.rb"
  ]
  s.homepage = %q{http://github.com/kristianmandrup/load-me}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{CSS parser}
  s.test_files = [
    "test/test_css_parser_basic.rb",
     "test/test_css_parser_loading.rb",
     "test/test_css_parser_media_types.rb",
     "test/test_css_parser_misc.rb",
     "test/test_css_parser_regexps.rb",
     "test/test_helper.rb",
     "test/test_merging.rb",
     "test/test_parsing.rb",
     "test/test_rule_set.rb",
     "test/test_rule_set_creating_shorthand.rb",
     "test/test_rule_set_expanding_shorthand.rb",
     "test/test_selector.rb",
     "test/test_selector_parsing.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

