Rails.application.routes.draw do

  namespace :api do
    scope module: :v2, constraints: ApiVersion.new('v2') do
      	resources :todos, only: :index
    end

    scope module: :v1, constraints: ApiVersion.new('v1', true) do
  		resources :todos do
    	resources :items
 	 end
 	    #get   'todos', 	 to: 'todos#index'
  		#post  'todos', 	 to: 'todos#create'
  		#get   'todos/:id',  to: 'todos#show'
  		#put   'todos/:id',  to: 'todos#update'
  		#delete 'todos/:id', to: 'todos#delete'

  		#get 'todos/:id/items', to: 'items#show'
  		#put 'todos/:id/items', to: 'items#update'
  		#delete 'todos/:id/items', to: 'items#delete'
    end
  end
  post 'auth/login', to: 'authentication#login'
  delete 'auth/logout', to: 'authentication#logout'
  post 'signup', to: 'users#create'

end
