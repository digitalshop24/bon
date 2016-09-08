class AddPreviewImageToPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :about, :text
    remove_attachment :posts, :image
    add_attachment :posts, :preview
  end
end
