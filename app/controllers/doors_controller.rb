class DoorsController < ApplicationController

	def index
		@user = current_user
		@doors = @user.doors if @user.doors
	end

end
