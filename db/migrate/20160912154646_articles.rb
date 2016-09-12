class Articles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body
      t.float :price
      t.references :category, foreign_key: true
      t.string :email, null: false
      t.string :link

      t.timestamps
    end
  end
end
