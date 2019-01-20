class Note < ApplicationRecord
  has_many :item_notes
  has_many :items, through: :item_notes

end
