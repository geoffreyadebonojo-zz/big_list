class ItemNote < ApplicationRecord
  belongs_to :item
  belongs_to :note
end
