class SessionsController < ApplicationController

	def new
		if logged_in?
			redirect_to root_path
		end
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			log_in(user)
			redirect_to root_path
		else
			redirect_to login_path
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path
	end

end
