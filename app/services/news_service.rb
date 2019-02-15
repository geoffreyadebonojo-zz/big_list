require 'pry'
require 'httparty'

class NewsService
  def initialize
    # @key = ENV['NEWS_API_KEY']
    @key = "00358d30e06847738cbb4f75d9519f47"
  end

  def all_sources_english
    response = HTTParty.get("https://newsapi.org/v2/sources?language=en&country=us&apiKey=#{@key}")
    response["sources"].map do |r|
      r["id"]
    end
  end

  def get_headlines(source)
    response = HTTParty.get("https://newsapi.org/v2/top-headlines?sources=#{source}&apiKey=#{@key}")
  end

  def get_major_sources_headlines
    sources = ["cnn", "cbs-news", "fox-news", "msnbc", "newsweek", "the-new-york-times", "the-washington-post", "the-washington-times"]
    source_headlines = sources.map do |source|
      response = HTTParty.get("https://newsapi.org/v2/top-headlines?sources=#{source}&apiKey=#{@key}")
    end
  end

  def breaking_news(quantity)
    sources = ["cnn", "cbs-news", "fox-news", "msnbc", "newsweek", "the-new-york-times", "the-washington-post", "the-washington-times"]
    source_headlines = sources.map do |source|
      response = HTTParty.get("https://newsapi.org/v2/top-headlines?sources=#{source}&apiKey=#{@key}")
    end
    news_results = {}
    source_headlines.each do |source|
      source["articles"][0...3].each do |result|
        news_results[result["title"]] = NewsResult.new(result)
      end
    end
    sorted = news_results.sort_by {|key, value| value.published_at}.reverse
    # top_ten = sorted[0...quantity].to_h.values
    top_ten = sorted.to_h.values
  end

  def assemble_headlines(source)
    get_headlines(source)["articles"].inject([]) do |sum, article|
      sum << "#{article['title']} "
    end #.split("CNN Video").join
  end

  def get_all_headlines
    sources = all_sources_english
    sources.map do |source|
      assemble_headlines(source)
    end.flatten
  end

  def search_all_headlines(term)
    response = HTTParty.get("https://newsapi.org/v2/everything?q=#{term}&apiKey=#{@key}")
    articles = response["articles"]
  end

  def histogram
    @all_headlines = get_all_headlines.join
    words = @all_headlines.split(" ")
    histogram = Hash.new(0)
    x = words.each do |word|
      histogram[word.downcase] += 1
    end
    # This should become an API call to dictionary
    histogram["the"]= 0
    histogram["of"]= 0
    histogram["to"]= 0
    histogram["in"]= 0
    histogram["and"]= 0
    histogram["are"]= 0
    histogram["a"]= 0
    histogram["this"]= 0
    histogram["have"]= 0
    histogram["on"]= 0
    histogram["for"]= 0
    histogram["be"]= 0
    histogram["at"]= 0
    histogram["is"]= 0
    histogram["say"]= 0
    histogram["says"]= 0
    histogram["as"]= 0
    histogram["with"]= 0
    histogram["from"]= 0
    histogram["will"]= 0
    histogram["not"]= 0
    histogram["you"]= 0
    histogram["his"]= 0
    histogram["by"]= 0
    histogram["that"]= 0
    histogram["could"]= 0
    histogram["an"]= 0
    histogram["what"]= 0
    histogram["it"]= 0
    histogram["-"]= 0
    sorted_values = histogram.sort_by {|_key, value| value}.to_h
    top_words = sorted_values.to_a.reverse.first(50).to_h
  end

end
