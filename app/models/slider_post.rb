class SliderPost < ApplicationRecord
  has_attached_file :preview, styles: { medium: "700x465#", small: "400x266#", thumb: "160x106#" },
                    default_url: ":s3_missing_url.jpg"
  validates_attachment_content_type :preview, content_type: /\Aimage\/.*\z/
end
