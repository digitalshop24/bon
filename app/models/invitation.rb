class Invitation < ApplicationRecord
	validates :email, presence: true
end
