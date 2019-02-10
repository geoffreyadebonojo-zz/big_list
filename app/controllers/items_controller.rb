class ItemsController < ApplicationController
  def index

    if params[:sort]
      @items = Item.filter(params[:sort]).order(created_at: :desc)
    else
      @items = Item.all.order(:created_at)
    end

  end

  def show
    @item = Item.find(params[:id])
    @notes = @item.notes
    @note = @item.notes.new

    # cache this
    if params[:cmd] == "youtube"
      @videos = YoutubeService.new(@item.name).embed_links.uniq.first(16)
    elsif params[:cmd] == "wikipedia"
      @wikipedia_search_term = @item.name.gsub(/[ ]/, "_")
    elsif params[:cmd] == "google"
      @google_search_results = GoogleService.new(@item.name).load_pages
      # @google_search_results = [["link1", "l"],["link2", "l"],["link3", "l"],["link4", "l"]]
    end

    search_term = @item.name.gsub(/[ ]/, "+")
    @amazon_link = "https://www.amazon.com/s/ref=nb_sb_noss_1?url=search-alias%3Daps&field-keywords=#{search_term}&rh=i%3Aaps%2Ck%3A#{search_term}"
  end

  def create
    @item = Item.create(item_params)
    @item.category = @item.category.downcase
    @item.save
    redirect_to item_path(@item)
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

  def edit
    h = Hash.new("")
    icons = Item.all.map do |x|
      ItemPresenter.new(x).category
    end.uniq
    @item = Item.find(params[:id])
    @icons_array = icons.zip(Item.all.pluck(:category).uniq)
    @icons_array.pop
    images_raw = GoogleImageService.new(@item.name, @item.category).img_array
    images_raw.pop
    @images = images_raw
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @item.category = @item.category.downcase
    @item.save
    redirect_to edit_item_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :category, :image)
  end
end
