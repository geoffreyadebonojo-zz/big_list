require 'spec_helper'

RSpec.describe "Items#index" do
  it "shows items" do
    Item.create(category: "film", name: "Star Wars")
    Item.create(category: "film", name: "Empire Strikes Back")
    Item.create(category: "film", name: "Return of the Jedi")
    visit '/items'
    expect(current_path).to eq(items_path)
    expect(page).to have_content("Star Wars")
    expect(page).to have_content("Empire Strikes Back")
    expect(page).to have_content("Return of the Jedi")
  end
end
