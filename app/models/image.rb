class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :image, styles: { medium: "700x465#", small: "400x266#", thumb: "160x106#" },
                    default_url: ":s3_missing_url.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  rails_admin do
    edit do
      field :image
    end
  end
end
