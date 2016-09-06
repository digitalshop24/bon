class Post < ApplicationRecord
	belongs_to :category
	has_many :taggings
  	has_many :tags, through: :taggings

	has_attached_file :image, styles: { medium: "700x465#", small: "400x266#", thumb: "160x106#" }, default_url: ":s3_missing_url"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	validates :category, :title, presence: true


  	rails_admin do
		edit do
	      field :status, :enum do 
	        enum do
	          ['public', 'draft']
	        end
	      end
	      fields :title, :location, :score, :category, :image
	    end
	end
end
