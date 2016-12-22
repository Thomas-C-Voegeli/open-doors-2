class UsersController < ApplicationController

	def index
		if logged_in?
			# @user = current_user
			redirect_to root_path
		else
			redirect_to signup_path
		end
	end

	def new
		if logged_in?
			redirect_to root_path
		end
	end

	def show
		if logged_in?
			@user = current_user
		else
			redirect_to signup_path
		end
	end

	def create
		user = User.new(user_params)
		if user.save
			log_in(user)
			redirect_to root_path
		else
			redirect_to signup_path
		end
	end

	private
		def user_params
			params.require(:user).permit(:email, :password,
																		:password_confirmation)
		end

end
