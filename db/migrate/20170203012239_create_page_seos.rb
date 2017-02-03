class CreatePageSeos < ActiveRecord::Migration[5.0]
  def change
    create_table :page_seos do |t|
      t.string :key
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
