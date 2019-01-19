class MusicController < ApplicationController
  def index
    @music_items = Music.all
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.create(music_params)
    redirect_to music_path
  end

  private

  def music_params
    params.require(:music).permit(:url)
  end
end
