class DocumentaryGetter
  attr_accessor :page

  def initialize(search_term)
    @base        = "https://www.documentaryheaven.com/category/" + search_term
    @agent       = Mechanize.new
    @agent.get(@base)
    @page = @agent.page
  end

  def find_links
    raw_links = @page.body.to_s.split("\n").find_all {|x| x.include?('class="watch"')}
    raw_links.map {|x| x.split("href=").last.split('"')[1]}
  end

end
