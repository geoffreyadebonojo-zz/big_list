class Scraper
  attr_accessor :page
  def initialize(site)
    @url = site
    @doc = HTTParty.get(@url)
    @page = Nokogiri::HTML(@doc)
  end

  def raw_text
    raw = @page.to_s.split(/\n+/)
  end
end
