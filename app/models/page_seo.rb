class PageSeo < ApplicationRecord
	DEFAULT_TITLE = 'Bon'
	DEFAULT_DESCRIPTION = '#bon - not just a dog!'

	def title
		self[:title] || DEFAULT_TITLE
	end

	def description
		self[:description] || DEFAULT_DESCRIPTION
	end
end
