# frozen_string_literal: true

require 'minitest/autorun'

class JekyllNavigationCheckerTest < Minitest::Test

  URLSFROMNAVIGAITONCASES = {
    File.new('../resources/_data/bad-links-dont-end-with-slash', 'r') => Array.new("/inspirations"),
    File.new('../resources/_data/good-links-end-wth-slash', 'r') => Array.new("/inspirations/"),
    File.new('../resources/_data/mixed-some-links-dont-end-with-slash', 'r') => Array.new("/about/", "/inspirations"),
  }

  def urlsFromNavigationTest
    URLSFROMNAVIGAITONCASES.each do |input, expected|
      actual = JekyllNavigationChecker.getUrlsFromNavigationYml(input)
      assert_equal(actual, expected)
    end
  end

  DOESFILEEXISTCASES = {
    File.new('../resources/_data/bad-links-dont-end-with-slash', 'r') => true,
    File.new('../resources/_data/good-links-end-wth-slash', 'r') => true,
    File.new('../resources/_data/mixed-some-links-dont-end-with-slash', 'r') => true,
    File.new('../resources/_data/non-existent file', 'r') => false
  }

  def doesFileExist
    DOESFILEEXISTCASES.each do |input, expected|
      actual = JekyllNavigationChecker.doesFileExist(input)
      assert_equal(actual, expected)
    end
  end

  def doesFileHaveContents
    assert_equal JekyllNavigationChecker.doesFileHaveContent(nil), true
  end

  NAVIGTIONYMLURLSCASES = {
    File.new('../resources/_data/bad-links-dont-end-with-slash', 'r') => false,
    File.new('../resources/_data/good-links-end-wth-slash', 'r') => true,
    File.new('../resources/_data/mixed-some-links-dont-end-with-slash', 'r') => false,
    File.new('../resources/_data/non-existent file', 'r') => false
  }

  def doNavigationYmlUrlsEndInSlash
    NAVIGTIONYMLURLSCASES.each do |input, expected|
      actual = ekyllNavigationChecker.doNavigationYmlUrlsEndInSlash(input)
      assert_equal(actual, expected)
    end
  end

  def doesNavigationYmlMatchPermalinks
    assert_equal JekyllNavigationChecker.doesNavigationYmlMatchPermalinks(nil), true
  end
end
