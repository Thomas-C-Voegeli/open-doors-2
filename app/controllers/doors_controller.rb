class DoorsController < ApplicationController

	def index
		if logged_in?
			@user = current_user
			# @user.doors.create(country: "USA", state: "WA", city: "Bellingham", street: "Whitewater Dr.", street_number: "909", zipcode: "54321")
			@doors = @user.doors.all
		else
			redirect_to login_path
		end
	end

	def edit
		if logged_in?
			@user = current_user
			@doors = @user.doors.all
			@door = Door.find(params[:id])
			render :edit
		else
			redirect_to login_path
		end
	end

	def create
		door = Door.new(country: params[:country], state: params[:state], city: params[:city], street: params[:street], street_number: params[:street_number], zipcode: params[:zipcode])
		if door.save
			redirect_to root_path
		else
			redirect_to edit_door_path
		end
	end

	def update
		@door = Door.find(params[:id])
		@door.update(country: params[:country], state: params[:state], city: params[:city], street: params[:street], street_number: params[:street_number], zipcode: params[:zipcode])
		redirect_to door_path(@door)
	end

end
