class Door < ApplicationRecord

	has_and_belongs_to_many :users
	validates :country, :state, :city, :street, :street_number, :zipcode, presence: true

	def full_address
			"#{self.street_number} #{self.street}, #{self.city}, #{self.state}, #{self.country} #{self.zipcode}"
		end

end
