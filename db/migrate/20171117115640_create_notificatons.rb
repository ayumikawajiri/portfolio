class CreateNotificatons < ActiveRecord::Migration[5.1]
  def change
    create_table :notificatons do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
