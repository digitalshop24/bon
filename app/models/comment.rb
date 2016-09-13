class Comment < ApplicationRecord
  belongs_to :post

  validates :name, :text, :email, presence: true
end
