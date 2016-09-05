class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :location
      t.integer :score
      t.integer :category_id

      t.timestamps
    end
  end
end
