class JekyllNavigationChecker < HTMLProofer::Check
  def self.hi
    puts "hi"
  end

  def run

  end # end of run

  def doesFileExist(file)
    return !File.exist?(file)
  end

  def doesFileHaveContent(file)
    return File.size(file) < 1
  end

  def doesNavigationYmlMatchPermalinks(file)
    navigationYmlUrls = getUrlsFromNavigationYml(file)

  end
end