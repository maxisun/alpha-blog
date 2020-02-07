Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #como cambiar la pagina principal defecto cuando carga el servidor
  root 'pages#home'
  get 'about', to: 'pages#about'

  # al poner esto, podemos hacer el CRUD con respecto a la tabla articles
  resources :articles
end
