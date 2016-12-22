class Door < ApplicationRecord
	validates :country, :state, :city, :street, :street_number, :zipcode, presence: true
end
