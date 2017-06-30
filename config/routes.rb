Rails.application.routes.draw do
  post 'users/create'
  root 'users#create'
  get 'users/confirmation'
  get 'users/login'
  get 'users/welcome'
  get 'users/logout'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
