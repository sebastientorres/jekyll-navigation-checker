Gem::Specification.new do |s|
  s.name        = "jekyll-navigation-checker"
  s.version     = "0.0.1"
  s.summary     = "Jekyll navigation checker HTMLProofer plugin"
  s.description = "Test the navigation urls and permalinks end with / for a Jekyll site"
  s.authors     = ["Sebastien Torres"]
  s.email       = "baztorres@gmail.com"
  s.files       = ["lib/checker/jekyll-navigation-checker.rb"]
  s.homepage    =
    "https://rubygems.org/gems/navigation-checker"
  s.license       = "MIT"
  s.add_dependency "html-proofer"
end
