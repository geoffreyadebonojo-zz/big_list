class ItemPresenter

  def initialize(item)
    @item = item
  end

  def category
    case @item.category
    when "film"
      '<i class="fas fa-film"></i>'.html_safe
    when "documentary"
      '<i class="fas fa-film"></i>'.html_safe
    when "person"
      '<i class="fa fa-user" aria-hidden="true"></i>'.html_safe
    when "manga"
      '<i class="fas fa-book"></i>'.html_safe
    when "book"
      '<i class="fas fa-book"></i>'.html_safe
    when  "science"
      '<i class="fas fa-microscope"></i>'.html_safe
    when "web-development"
      '<i class="fas fa-laptop"></i>'.html_safe
    when "resource"
      '<i class="fas fa-laptop"></i>'.html_safe
    when "music"
      '<i class="fa fa-music" aria-hidden="true"></i>'.html_safe
    when "youtube-search"
      '<i class="fab fa-youtube"></i>'.html_safe
    when "topic"
      '<i class="fas fa-search"></i>'.html_safe
    end
  end

end
