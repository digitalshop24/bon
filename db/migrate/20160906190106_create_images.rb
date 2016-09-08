class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.attachment :image
      t.references :imageable, index: true, polymorphic: true

      t.timestamps null: false
    end
  end
end