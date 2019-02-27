class PageLoader
  def initialize(url)
    string_in = Scraper.new(url).raw_text.to_s
    
  end
end
