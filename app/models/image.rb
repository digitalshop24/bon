class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  attr_reader :width

  has_attached_file :image, default_url: ":s3_missing_url.jpg",
  styles: {
      medium: "700x465#", small: "400x266#", thumb: "160x106#",
      slider:  Proc.new { |a| a.slider_size }
    }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  rails_admin do
    edit do
      field :image
    end
  end

  def slider_size
    geometry = Paperclip::Geometry.from_file(Paperclip.io_adapters.for(image))
    "#{geometry.width.to_i}x#{geometry.width.to_i/4}#"
  end
end
