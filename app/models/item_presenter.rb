class ItemPresenter

  def initialize(item)
    @item = item
  end

  def category
    case @item.category
    when "film"
      '<i class="fas fa-film"></i>'.html_safe
    when "person"
      '<i class="fa fa-user" aria-hidden="true"></i>'.html_safe
    when "manga"
      '<i class="fas fa-book"></i>'.html_safe
    end
  end

end