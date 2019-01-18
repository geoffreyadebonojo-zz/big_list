class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    # cache this
    @images = GoogleImageService.new(@item.name).img_array.first(8)
    @videos = YoutubeService.new(@item.name).embed_links.uniq.first(8)
  end
end
