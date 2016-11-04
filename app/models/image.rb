class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :image, default_url: ":s3_missing_url.jpg",
    styles: lambda { |a| { 
      medium: "700x465#", small: "400x266#", thumb: "160x106#", 
      slider: "#{a.instance.width}x#{a.instance.width/4}#" }
    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  rails_admin do
    edit do
      field :image
    end
  end
end
