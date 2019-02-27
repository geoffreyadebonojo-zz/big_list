class YoutubeService
  attr_accessor :page

  def initialize(search_term)
    @search_term = search_term.gsub(/[ ]/, '+')
    @base        = "https://www.youtube.com/"
    @agent       = Mechanize.new
    @agent.get(@base)
    @page
    submit_search
  end

  def submit_search
    @page = @agent.page
    @page.forms.last.fields.first.value = @search_term
    @page.forms.last.submit
    @page = @agent.page
  end

  def watch_links
    mechanize_links = @page.links.to_s.split("\n").uniq.find_all {|x| x.include?("/watch?")}
    mechanize_links.map {|y| y.split('"')[-2]}
  end

  def random_link
    "https://youtube.com#{watch_links.sample}"
  end

  def embed_link
    "https://youtube.com/embed/" + random_link.split("=").last
  end

  def embed_links
    watch_links.map do |link|
      "https://youtube.com/embed/" + link.split("=").last
    end
  end

end
