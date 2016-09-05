class Category < ApplicationRecord
	has_many :posts
	has_attached_file :bon_img_type, default_url:"/images/:style/missing.png"
  validates_attachment_content_type :bon_img_type, content_type: /\Aimage\/.*\z/
end
