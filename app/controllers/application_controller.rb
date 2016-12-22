class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	# Make current_user method available to views like application.html.erb
	helper_method :current_user

	def authorize
		redirect_to '/login' unless current_user
	end

	def logged_in?
	!current_user.nil?
	end

end
