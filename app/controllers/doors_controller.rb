class DoorsController < ApplicationController
	before_filter :authorize

	def index
		@user = current_user
		@doors = @user.doors.all
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
		@door = Door.find(params[:id])
		render :edit
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

		if door.user.id == current_user.id
			if door.destroy
				flash[:success] = "Record deleted"
			else
				flash[:error] = "Error deleting that record"
		else
			flash[:error] = "You don't have permission to delete that record"
		end

		redirect_to root_path
	end

	private
		def door_params
			params.require(:door).permit(:country, :state, :city, :street, :street_number, :zipcode)
		end

end
