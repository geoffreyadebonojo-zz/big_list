class AddNameToMusic < ActiveRecord::Migration[5.2]
  def change
    add_column :musics, :name, :string
  end
end
