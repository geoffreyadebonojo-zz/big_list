class ApplicationController < ActionController::Base
  helper_method :random_documentary, :now_playing, :other_songs

  def random_documentary
    topics = ["history", "nature", "space", "science", "biographies", "archaeology", "movies", "mystery"]
    @documentary ||= DocumentaryGetter.new(topics.sample).find_links.sample
    binding.pry
  end

  def now_playing
    @playing ||= Music.all.sample
  end

end
