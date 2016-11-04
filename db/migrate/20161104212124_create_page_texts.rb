class CreatePageTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :page_texts do |t|
      t.text :content
      t.string :page
      t.string :position

      t.timestamps
    end
  end
end
