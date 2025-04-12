# frozen_string_literal: true

require 'minitest/autorun'
require 'jekyll-navigation-checker'

class JekyllNavigationCheckerTest < Minitest::Test

  URLSFROMNAVIGAITONCASES = {
    'test/resources/_data/bad-links-dont-end-with-slash' => ['/inspirations'],
    'test/resources/_data/good-links-dont-end-with-slash' => ['/inspirations/'],
    'test/resources/_data/mixed-some-links-dont-end-with-slash' => ['/about/', '/inspirations']
  }

  def test_urlsFromNavigation
    URLSFROMNAVIGAITONCASES.each do |path, expected|
      file = File.new(path, 'r')
      actual = JekyllNavigationChecker.getUrlsFromNavigationYml(file)
      assert_equal(actual, expected)
    end
  end

  DOESFILEEXISTCASES = {
    'test/resources/_data/bad-links-dont-end-with-slash' => true,
    'test/resources/_data/good-links-dont-end-with-slash' => true,
    'test/resources/_data/mixed-some-links-dont-end-with-slash' => true,
    'test/resources/_data/non-existent file' => false
  }

  def test_doesFileExist
    DOESFILEEXISTCASES.each do |path, expected|
      file = File.new(path, 'r')
      actual = JekyllNavigationChecker.doesFileExist(file)
      assert_equal(actual, expected)
    end
  end
#
#   def doesFileHaveContents
#     assert_equal JekyllNavigationChecker.doesFileHaveContent(nil), true
#   end
#
#   NAVIGTIONYMLURLSCASES = {
#     '../resources/_data/bad-links-dont-end-with-slash' => false,
#     '../resources/_data/good-links-end-wth-slash' => true,
#     '../resources/_data/mixed-some-links-dont-end-with-slash' => false,
#     '../resources/_data/non-existent file' => false
#   }
#
#   def doNavigationYmlUrlsEndInSlash
#     NAVIGTIONYMLURLSCASES.each do |path, expected|
#       puts path
#       file = File.new(path, 'r')
#       actual = JekyllNavigationChecker.doNavigationYmlUrlsEndInSlash(file)
#       assert_equal(actual, expected)
#     end
#   end
#
#   def doesNavigationYmlMatchPermalinks
#     assert_equal JekyllNavigationChecker.doesNavigationYmlMatchPermalinks(nil), true
#   end
end
