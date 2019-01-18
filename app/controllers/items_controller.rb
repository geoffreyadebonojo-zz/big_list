class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    # cache this
    # @images = GoogleImageService.new(@item.name).img_array.first(8)
    @videos = YoutubeService.new(@item.name).embed_links.uniq.first(16)
  end

  def create
    Item.create(item_params)
    redirect_to items_path
  end

  def new
    h = Hash.new("")
    icons = Item.all.map do |x|
      ItemPresenter.new(x).category
    end.uniq

    @icons_array = icons.zip(Item.all.pluck(:category).uniq)
    @icons_array.pop

    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name, :category)
  end
end
