require 'html-proofer'

class JekyllNavigationChecker < HTMLProofer::Check
  def self.hi
    puts "hi"
  end

  def run

    navYml = "navgation.yml"
    dataPath = "./_data/"

    navYmlPath = dataPath + navYml

    return add_failure("file doesn't exist") if !doesFileExist(navYmlPath)
    return add_failure("file is empty") if !doesFileHaveContent(navYmlPath)
    return add_failure("navigation yml urls don't end in /") if true
    return add_failure("markdown permalinks don't end in /") if true
    return add_failure("navigation and markdown links don't align") if doesNavigationYmlMatchPermalinks(navYmlPath)
  end # end of run

  def self.doesFileExist(file)
    return false
  end

  def self.doesFileHaveContent(file)
    return false
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
    return false;
  end

  def self.doesNavigationYmlMatchPermalinks(file)
    return false;
  end
end