class ApplicationController < ActionController::Base
  helper_method :random_documentary

  def random_documentary
    topics = ["history", "nature", "space", "science", "biographies", "archaeology", "movies", "mystery"]
    @documentary ||= DocumentaryGetter.new(topics.sample).find_links.sample
    binding.pry
  end
end
