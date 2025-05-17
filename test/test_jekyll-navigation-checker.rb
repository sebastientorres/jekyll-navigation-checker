# frozen_string_literal: true

require 'minitest/autorun'
require 'jekyll-navigation-checker'

class JekyllNavigationCheckerTest < Minitest::Test

  def test_getUrlsFromNavFile_doesntEndWithSlashes
    file = File.new('test/resources/_data/bad-links-dont-end-with-slash', 'r')
    actual = JekyllNavigationChecker.getUrlsFromNavigationYml(file)
    assert_equal ['/inspirations'], actual
  end

  def test_getUrlsFromNavFile_EndsWithSlashes
    file = File.new('test/resources/_data/good-links-end-with-slash', 'r')
    actual = JekyllNavigationChecker.getUrlsFromNavigationYml(file)
    assert_equal ['/inspirations/'], actual
  end

  def test_getUrlsFromNavFile_mixed_someDontEndWithSlash
    file = File.new('test/resources/_data/mixed-some-links-dont-end-with-slash', 'r')
    actual = JekyllNavigationChecker.getUrlsFromNavigationYml(file).sort
    assert_equal ['/about/', '/inspirations'], actual
  end

  def test_doesFileExist_bad
    actual = JekyllNavigationChecker.doesFileExist('test/resources/_data/bad-links-dont-end-with-slash')
    assert_equal true, actual
  end

  def test_doesFileExist_good
    actual = JekyllNavigationChecker.doesFileExist('test/resources/_data/good-links-end-with-slash')
    assert_equal true, actual
  end

  def test_doesFileExist_mixed
    actual = JekyllNavigationChecker.doesFileExist('test/resources/_data/mixed-some-links-dont-end-with-slash')
    assert_equal true, actual
  end

  def test_doesFileExist_nonExistentFile
    actual = JekyllNavigationChecker.doesFileExist('test/resources/_data/non-existent-file')
    assert_equal false, actual
  end

  def test_doesFileExist_emptyFile
    actual = JekyllNavigationChecker.doesFileExist('test/resources/_data/empty-file')
    assert_equal true, actual
  end

  def test_doesFileHaveContents_bad
    actual = JekyllNavigationChecker.doesFileHaveContent('test/resources/_data/bad-links-dont-end-with-slash')
    assert_equal true, actual
  end

  def test_doesFileHaveContents_good
    actual = JekyllNavigationChecker.doesFileHaveContent('test/resources/_data/good-links-end-with-slash')
    assert_equal true, actual
  end

  def test_doesFileHaveContents_mixed
    actual = JekyllNavigationChecker.doesFileHaveContent('test/resources/_data/mixed-some-links-dont-end-with-slash')
    assert_equal true, actual
  end

  def test_doesFileHaveContents_nonExistentFile
    actual = JekyllNavigationChecker.doesFileHaveContent('test/resources/_data/non-existent-file')
    assert_equal false, actual
  end

  def test_doesFileHaveContents_emptyFile
    actual = JekyllNavigationChecker.doesFileHaveContent('test/resources/_data/empty-file')
    assert_equal false, actual
  end

  def test_emptyFileDoesntHaveContents
    assert_equal false, JekyllNavigationChecker.doesFileHaveContent(nil)
  end

  # def test_doNavigationYmlUrlsEndInSlash
  #   describe "Do navigation.yml URls end in /" do
  #     parameterized(:path, :expected) do
  #       input { ['test/resources/_data/bad-links-dont-end-with-slash' , false] }
  #       input { ['test/resources/_data/good-links-end-with-slash', true] }
  #       input { ['test/resources/_data/mixed-some-links-dont-end-with-slash', false] }
  #       input { ['test/resources/_data/non-existent-file', false] }
  #     end
  #
  #     it "Tests things" do
  #       file = File.new(path, 'r')
  #       actual = JekyllNavigationChecker.doNavigationYmlUrlsEndInSlash(file)
  #       assert_equal(actual, expected)
  #     end
  #   end
  # end

  # def test_doesNavigationYmlMatchPermalinks
  #   someMatch = 'some-match/'
  #   allMatch = 'all-match/'
  #   noneMatch = 'non-match/'
  #
  #   describe "Do navigation.yml URls end in slash" do
  #     parameterized(:scenario, :expected) do
  #       input { [someMatch, false] }
  #       input { [allMatch, true] }
  #       input { [noneMatch, false] }
  #     end
  #
  #     it "nav urls and page permalinks match" do
  #       dataPath = 'test/resources/_data/'
  #       postsPath = 'test/resources/_posts/'
  #       file = File.new(dataPath + scenario, 'r')
  #       assert_equal expected, JekyllNavigationChecker.doesNavigationYmlMatchPermalinks(file, postsPath + scenario)
  #     end
  #   end
  # end
end
