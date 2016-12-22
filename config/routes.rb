Rails.application.routes.draw do

	root 'doors#index'

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'

	get '/signup' => 'users#new'
	resources :users, only: [:index, :create, :edit, :show, :update, :destroy]

	resources :doors

end
