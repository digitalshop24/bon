class PostSection < ApplicationRecord
	belongs_to :post

	# has_attached_file :image, styles: { medium: "700x465#", small: "400x266#", thumb: "160x106#" }, default_url: ":s3_missing_url.jpg"
	# validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates :post, presence: true
end
