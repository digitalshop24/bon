class Gallery < ApplicationRecord
  belongs_to :galleryable
  has_many :images, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :images
end
