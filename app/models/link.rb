class Link < ApplicationRecord
  scope :sidebar, ->{ where(position: 'sidebar') }
  scope :footer, ->{ where(position: 'footer') }
end
