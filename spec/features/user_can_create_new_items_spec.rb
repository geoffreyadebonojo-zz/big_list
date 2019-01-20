require 'rails_helper'

RSpec.describe "Item#create" do
  it "creates an item" do
    visit '/items'
    expect(current_path).to eq('/items')
    click_on "New Item"
    expect(current_path).to eq('/items/new')
    expect(page).to have_content("New Item")
  end
end
