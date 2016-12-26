class DoorsController < ApplicationController
	before_action :authorize

	def index
		@user = current_user
		@doors = @user.doors.all
		if request.xhr?
			render :index, layout: false
		else
			@doors
		end
	end

	def create
		@user = current_user
		@door = @user.doors.create(door_params)
		if @door.save
			redirect_to root_path
			flash[:success] = "Successfully Added"
		else
			flash[:error] = "Error adding that record"
			redirect_to new_door_path
		end
	end

	def edit
		@door = Door.find(params[:id])
			if request.xhr?
				render :edit, layout: false
			end
	end

	def show
	end

	def new
		@door = Door.new
		if request.xhr?
				render :new, layout: false
			end
	end

	def update
		@door = Door.find(params[:id])
		@user = current_user
		if request.xhr?
			if @door.update(door_params)
				@doors = @user.doors.all
				render :index, layout: false
			end
		else
			redirect_to root_path
		end

	end

	def destroy
		door = Door.find(params[:id])
		if door.destroy
			flash[:success] = "Record deleted"
		else
			flash[:error] = "Error deleting that record"
		end

		redirect_to root_path
	end

	private
		def door_params
			params.require(:door).permit(:country, :state, :city, :street, :street_number, :zipcode)
		end

end
