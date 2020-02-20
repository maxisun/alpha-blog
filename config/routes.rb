Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #como cambiar la pagina principal defecto cuando carga el servidor
  root 'pages#home'
  get 'about', to: 'pages#about'

  #users
  get 'signup', to: 'users#new'
  #sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  #post 'users', to: 'users#create' #=> se puede hacer asi 
  resources :users, except: [:new]
  # al poner esto, podemos hacer el CRUD con respecto a la tabla articles
  resources :articles


end
