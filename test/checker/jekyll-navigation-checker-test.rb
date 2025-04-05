# frozen_string_literal: true

require 'minitest/autorun'

class JekyllNavigationCheckerTest < Minitest::Test
  def getUrlsFromNavigationYml

    actual = JekyllNavigationChecker.getUrlsFromNavigationYml(nil)
    expected = Array.new('/', '/bad')
    assert_equal actual, expected
  end

  def doesFileExist
    assert_equal JekyllNavigationChecker.doesFileExist(nil), true
  end

  def doesFileHaveContents
    assert_equal JekyllNavigationChecker.doesFileHaveContent(nil), true
  end

  def doNavigationYmlUrlsEndInSlash
    assert_equal JekyllNavigationChecker.doNavigationYmlUrlsEndInSlash(nil), true
  end

  def doesNavigationYmlMatchPermalinks
    assert_equal JekyllNavigationChecker.doesNavigationYmlMatchPermalinks(nil), true
  end
end
