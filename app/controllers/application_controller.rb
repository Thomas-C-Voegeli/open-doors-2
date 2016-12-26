class ApplicationController < ActionController::Base
	include SessionsHelper
	protect_from_forgery with: :exception

	def index
		render :construction
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	# Make current_user method available to views
	helper_method :current_user

	def authorize
		redirect_to '/login' unless current_user
	end

end
