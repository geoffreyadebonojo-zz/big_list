require 'rails_helper'

RSpec.describe "User clicks edit" do
  it "goes to edit page" do
    item = Item.create(name: "Star Trek", category: "tv-show")
    visit '/items'
    click_on 'Edit'
    expect(current_path).to eq(edit_item_path(item))
  end
end
