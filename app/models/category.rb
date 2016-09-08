class Category < ApplicationRecord
	has_many :posts
	has_attached_file :bon_img_type, styles: { medium: "700x465#", small: "400x266#", thumb: "160x106#" },
										default_url: ":s3_missing_url.jpg"
  validates_attachment_content_type :bon_img_type, content_type: /\Aimage\/.*\z/
end
