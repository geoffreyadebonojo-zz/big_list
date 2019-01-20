class MusicController < ApplicationController
  def index
    @music_items = Music.all
    @music = Music.new
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.create(music_params)
    embed_uri = @music.url.split("/").last
    @music.url = "https://www.youtube.com/embed/" + embed_uri
    @music.save
    redirect_to music_index_path
  end

  private

  def music_params
    params.require(:music).permit(:url, :name)
  end
end
