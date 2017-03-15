Rails.application.routes.draw do
  # get 'static_pages/home'
  root 'static_pages#home'
  get 'about'   => 'static_pages#about'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  resources :users
  resources :students
end
