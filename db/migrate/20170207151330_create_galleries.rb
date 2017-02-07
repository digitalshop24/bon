class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.references :galleryable, index: true, polymorphic: true

      t.timestamps
    end
  end
end
