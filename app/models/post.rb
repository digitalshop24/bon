class Post < ApplicationRecord
	belongs_to :category
	has_many :post_sections, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  # has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :post_sections, allow_destroy: true

  acts_as_taggable

	scope :to_slider, -> { where(to_slider: true) }
  scope :published, -> { where(status: 'publish') }
  scope :drafted, -> { where(status: 'draft') }

  after_create :create_about_section

	validates :category, :title, presence: true
  validates :score, :inclusion => { :in => 0..5, :message => "Оценка от 0 до 5" }

	rails_admin do
		edit do
	      field :status, :enum do 
	        enum do
	          ['public', 'draft']
	        end
	      end
	      fields :title, :to_slider, :location, :score, :category, :tag_list, :images, :post_sections
		end
  end

  def preview_url
    images.any? ? images.first.image.url : "http://s3-eu-central-1.amazonaws.com/bonapplication/noimage/posts/images/missing_original.jpg"
  end

  def about_section
    post_sections.first
  end

  def other_post_sections
    post_sections.offset(1)
  end

  def create_about_section
    post_sections.create(title: 'О заведении')
  end
end
