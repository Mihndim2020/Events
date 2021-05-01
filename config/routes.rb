Rails.application.routes.draw do

  get '/sessions/login' => 'sessions#new', as: 'login'
  post '/sessions/login', to: 'sessions#create'
  get '/sessions/logout' => 'sessions#destroy', as: 'logout'
  resources :sessions
  #get '/users/signup', to: 'users#new'
  get 'users/signup' => 'users#new', as: 'signup'
  resources :users, only: [:new, :create, :show, :edit, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
