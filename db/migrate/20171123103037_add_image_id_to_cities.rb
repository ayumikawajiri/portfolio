class AddImageIdToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :image_id, :string
  end
end
