class ApplicationController < ActionController::Base
  helper_method :random_documentary, :now_playing

  def random_documentary
    topics = ["history", "nature", "space", "science", "biographies", "archaeology", "movies", "mystery"]
    @documentary ||= DocumentaryGetter.new(topics.sample).find_links.sample
  end

  def now_playing
    @playing ||= Music.all.sample
  end

end
