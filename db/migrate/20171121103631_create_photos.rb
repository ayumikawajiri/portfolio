class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :file_id
      t.references :classified, foreign_key: true

      t.timestamps
    end
  end
end
