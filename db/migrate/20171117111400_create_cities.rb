class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :name
      t.text :introduction
      t.integer :state, default: 0, null: false

      t.timestamps
    end
  end
end
