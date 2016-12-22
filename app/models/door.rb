class Door < ApplicationRecord
	has_and_belongs_to_many :users
	validates :country, :state, :city, :street, :street_number, :zipcode, presence: true
end
