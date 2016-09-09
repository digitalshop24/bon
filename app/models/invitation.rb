class Invitation < ApplicationRecord
	validates :name, :email, presence: true
end
