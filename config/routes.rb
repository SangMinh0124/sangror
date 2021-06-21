Rails.application.routes.draw do
	resources :todos do
    resources :items
 	 end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get   'todos', 	 to: 'todos#index'
  post  'todos', 	 to: 'todos#create'
  get   'todos/:id',  to: 'todos#show'
  put   'todos/:id',  to: 'todos#update'
  delete 'todos/:id', to: 'todos#delete'

  get 'todos/:id/items', to: 'items#show'
  put 'todos/:id/items', to: 'items#update'
  delete 'todos/:id/items', to: 'items#delete'
end
