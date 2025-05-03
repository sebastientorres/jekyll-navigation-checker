# frozen_string_literal: true

require 'minitest/autorun'
require 'jekyll-navigation-checker'
require 'parameterized_testing/minitest/spec'

class JekyllNavigationCheckerTest < Minitest::Test

  def test_urls
    describe "URLs from navigation.yml" do
      parameterized(:path, :expected) do
        input { ['test/resources/_data/bad-links-dont-end-with-slash', ['/inspirations']] }
        input { ['test/resources/_data/good-links-end-with-slash', ['/inspirations/']] }
        input { ['test/resources/_data/mixed-some-links-dont-end-with-slash', ['/about/', '/inspirations']] }

        it "tests retrieving url" do
          file = File.new(path, 'r')
          actual = JekyllNavigationChecker.getUrlsFromNavigationYml(file)
          _(actual).must_equal(expected)
        end
      end
    end
  end


  def test_doesFileExist
    describe "Does file exist" do
      parameterized(:path, :expected) do
        input { ['test/resources/_data/bad-links-dont-end-with-slash',true,] }
        input { ['test/resources/_data/good-links-end-with-slash', true] }
        input { ['test/resources/_data/mixed-some-links-dont-end-with-slash', true] }
        input { ['test/resources/_data/non-existent file', false] }
      end

      it "Tests the provided file exists" do
        file = File.new(path, 'r')
        actual = JekyllNavigationChecker.doesFileExist(file)
        assert_equal(actual, expected)
      end

    end
  end

  def test_emptyFileDoesntHaveContents
    assert_equal false, JekyllNavigationChecker.doesFileHaveContent(nil)
  end

  def test_doNavigationYmlUrlsEndInSlash
    describe "Do navigation.yml URls end in /" do
      parameterized(:path, :expected) do
        input { ['test/resources/_data/bad-links-dont-end-with-slash' , false] }
        input { ['test/resources/_data/good-links-end-with-slash', true] }
        input { ['test/resources/_data/mixed-some-links-dont-end-with-slash', false] }
        input { ['test/resources/_data/non-existent-file', false] }
      end

      it "Tests things" do
        file = File.new(path, 'r')
        actual = JekyllNavigationChecker.doNavigationYmlUrlsEndInSlash(file)
        assert_equal(actual, expected)
      end
    end
  end

  def test_doesNavigationYmlMatchPermalinks

    describe "Do navigation.yml URls end in /" do
      parameterized(:path, :expected) do
        input { ['test/resources/_data/bad-links-dont-end-with-slash' , false] }
        input { ['test/resources/_data/good-links-end-with-slash', true] }
        input { ['test/resources/_data/mixed-some-links-dont-end-with-slash', false] }
        input { ['test/resources/_data/non-existent-file', false] }
      end
    end

    it "" do
      file = File.new(path, 'r')
      assert_equal JekyllNavigationChecker.doesNavigationYmlMatchPermalinks(file), true
    end
  end

end
