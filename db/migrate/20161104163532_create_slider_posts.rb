class CreateSliderPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :slider_posts do |t|
      t.string :title
      t.text :description
      t.attachment :preview
      t.string :url

      t.timestamps
    end
  end
end
