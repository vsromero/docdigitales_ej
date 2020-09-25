Rails.application.routes.draw do
  resources :usuarios
  resources :sucursales
  resources :empleados
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'usuarios#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  post '/checkEmail', to: 'usuarios#checkEmail'
  post '/checkRFC', to: 'usuarios#checkRFC'

  get 'home/index'

  root 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
