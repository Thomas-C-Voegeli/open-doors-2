class DoorsController < ApplicationController

	def index
		if logged_in?
			@user = current_user
			@doors = @user.doors.all
		else
			redirect_to login_path
		end
	end

	def create
		@user = current_user
		door = @user.doors.create(door_params)
		if door.save
			redirect_to root_path
		else
			redirect_to new_door_path
		end
	end

	def edit
		if logged_in?
			@door = Door.find(params[:id])
			render :edit
		else
			redirect_to login_path
		end
	end

	def new
	end

	def update
		@door = Door.find(params[:id])
		if @door.update(door_params)
			redirect_to door_path(@door)
		else
			render :edit
		end
	end

	def destroy
		door = Door.find(params[:id])
		door.destroy
		redirect_to root_path
	end

	private
		def door_params
			params.require(:door).permit(:country, :state, :city, :street, :street_number, :zipcode)
		end

end
