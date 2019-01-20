class CreateItemNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_notes do |t|
      t.references :item, foreign_key: true
      t.references :note, foreign_key: true

      t.timestamps
    end
  end
end
