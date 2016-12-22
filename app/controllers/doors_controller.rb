class DoorsController < ApplicationController

	def index
		if logged_in?
			@user = current_user
			@user.doors.create(country: "USA", state: "IL", city: "Bloomington", street: "Sparrow Ln.", 																			street_number: "123", zipcode: "54321")
			@doors = @user.doors.all
		else
			redirect_to signup_path
		end
	end

end
