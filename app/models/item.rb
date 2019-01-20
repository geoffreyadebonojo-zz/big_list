class Item < ApplicationRecord
  has_many :item_notes
  has_many :notes, through: :item_notes

  def self.filter(category)
    Item.where(category: category)
  end
end
