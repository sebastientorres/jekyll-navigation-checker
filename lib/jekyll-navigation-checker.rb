require 'html-proofer'

class JekyllNavigationChecker < HTMLProofer::Check
  def self.hi
    puts "hi"
  end

  def run

    navYml = "navgation.yml"
    dataPath = "./_data/"

    navYmlPath = dataPath + navYml

    postsPath = "./_posts"

    return add_failure("file doesn't exist") if !doesFileExist(navYmlPath)
    return add_failure("file is empty") if !doesFileHaveContent(navYmlPath)
    return add_failure("navigation yml urls don't end in /") if true
    return add_failure("markdown permalinks don't end in /") if true
    return add_failure("navigation and markdown links don't align") if doesNavigationYmlMatchPermalinks(navYmlPath, postsPath)
  end # end of run

  def self.doesFileExist(path)
    begin
      file = File.new(path, 'r')
      return nil != file
    rescue Exception => e
      puts "doesFileExist encountered ", e
      return false
    end
  end

  def self.doesFileHaveContent(path)
    begin
      file = File.new(path, 'r')
      return nil != file.size && file.size > 0
    rescue Exception => e
      puts "doesFileHaveContent encountered:", e
      return false
    end
  end

  def self.getUrlsFromNavigationYml(file)
    navUrls = Array.new
    matchIndex = 0;

    contents = file.read
    contents.gsub!(/\r\n?/, "\n")
    contents.each_line do |line|
      if String::new(line).include?( 'url')
        navUrls[matchIndex] = line.split(':')[1].strip
        matchIndex += 1
      end #end if
    end # end do
    return navUrls
  end  # of getUrlsFromNavigationYml

  def self.doNavigationYmlUrlsEndInSlash(file)
    urls = getUrlsFromNavigationYml(file)

    urls.each {|url| if !url.end_with?('/') then return false end }
    return true;
  end

  def self.doesNavigationYmlMatchPermalinks(file, postPath)
    navigationYml = getUrlsFromNavigationYml(file)
    return false;
  end

  def self.getPostsFromPath(path)

  end

end