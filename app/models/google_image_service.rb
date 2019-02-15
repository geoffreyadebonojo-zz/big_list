class GoogleImageService
  attr_reader :img_array

  def initialize(search_term, type)
    main_url = "https://www.google.com/search?tbm=isch&source=hp&biw=1199&bih=618&ei=kL_5W--kNqOcjgSOyKA4&q=#{search_term}+#{type}&oq=#{search_term}+#{type}&gs_l=img.3..0l10.3761.6795..7447...0.0..0.132.633.8j1......1....1..gws-wiz-img.....0..35i39.ddJuuxsnJWo"
    string_in = Scraper.new(main_url).raw_text.to_s

    @img_array = string_in.split("Image result for #{search_term}").map do |url|
      url.split("src=").last.split("width").first.split('\"')[1]
    end
  end
end
