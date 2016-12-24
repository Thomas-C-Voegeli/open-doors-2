class DoorsController < ApplicationController
	before_filter :authorize

	def index
		@user = current_user
		@doors = @user.doors.all
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

		puts "EDIT"
		@door = Door.find(params[:id])
			if request.xhr?
				puts "IN IF"
				render :edit, layout: false
			end
	end

	def show
	end

	def new
		@door = Door.new
	end

	def update
		@door = Door.find(params[:id])
		@user = current_user
		if request.xhr?
			if @door.update(door_params)
				@doors = @user.doors.all
				puts "*"*100
				render :index, layout: false
			end

			# respond_to do |format|
			# 	puts format
			# 	if request.xhr?
			# 	format.html { render :layout => false}
			# 	end
			# end
		else
			redirect_to root_path
			# if @door.update(door_params)
			# 	@door
			# else
			# 	format.json { render json: @door.errors, status: :unprocessable_entity }
			# end
		end
			# respond_to do |format|	
			# 	if @door.update(door_params)
			# 		format.html { redirect_to root_path, notice: 'Door was successfully updated.' }
			# 		format.js   {}
			# 		format.json { render json: @door, status: :updated, location: @door }
			# 	else
			# 		format.html { render action: "new" }
			# 		format.json { render json: @door.errors, status: :unprocessable_entity }
			# 	end
			# end
			
			# if request.xhr?
			# 	nil
			# else
			# 	render :edit
			# end

			# respond_to :xhtml if request.xhr? 
			# @doors
			# redirect_to controller: :doors, action: :index, anchor: @door.id

	end

	def destroy
		door = Door.find(params[:id])

		# if door.users.id == current_user.id
		if door.destroy
			flash[:success] = "Record deleted"
		else
			flash[:error] = "Error deleting that record"
		end
		# else
		# 	flash[:error] = "You don't have permission to delete that record"
		# end

		redirect_to root_path
	end

	private
		def door_params
			params.require(:door).permit(:country, :state, :city, :street, :street_number, :zipcode)
		end

end
