class Post < ApplicationRecord
	belongs_to :category
	has_many :taggings
  	has_many :tags, through: :taggings
	has_attached_file :image, default_url:"/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
