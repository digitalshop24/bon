class CreatePostSections < ActiveRecord::Migration[5.0]
  def change
    create_table :post_sections do |t|
			t.string :title
    	t.text :description
    	t.integer :score
			t.references :post

    	t.timestamps
    end
  end
end
