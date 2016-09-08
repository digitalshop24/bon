class ChangeColumnsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :to_slider, :boolean, default: false
    add_column :posts, :about, :text
    add_column :posts, :description, :text
  end
end