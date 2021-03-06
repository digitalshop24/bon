class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  attr_reader :width

  has_attached_file :image, default_url: ":s3_missing_url.jpg",
  styles: {
      medium: "700x465#", small: "400x266#", thumb: "160x106#",
      slider:  Proc.new { |a| a.slider_size }
    }, :processors => [:cropper]

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h, :cropped

  after_update :reprocess_slider, if: :cropping?
  skip_callback :update, :after, :reprocess_slider, if: :cropped

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  rails_admin do
    edit do
      field :image
    end
  end

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
  
  def image_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(Paperclip.io_adapters.for(image))
  end
  

  def slider_size
    geometry = Paperclip::Geometry.from_file(Paperclip.io_adapters.for(image))
    "#{geometry.width.to_i}x#{geometry.width.to_i/4}#"
  end
  
  private
  
  def reprocess_slider
    @cropped = true
    image.reprocess! :slider
  end
end
