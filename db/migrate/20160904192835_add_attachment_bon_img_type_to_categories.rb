class AddAttachmentBonImgTypeToCategories < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.attachment :bon_img_type
    end
  end

  def self.down
    remove_attachment :categories, :bon_img_type
  end
end
