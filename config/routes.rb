Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	
	# get '/', to: redirect('/users')
	# root to: 'users#index'

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'

	# get '/users' => 'users#index'
	get '/signup' => 'users#new'
	resources :users, only: [:index, :create, :edit, :show, :update, :destroy]

end
