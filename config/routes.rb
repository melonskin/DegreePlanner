Rails.application.routes.draw do
  get 'courses/show'

  get 'course/show'

  get 'sessions/new'

  # get 'static_pages/home'
  root 'static_pages#home'
  get 'about'   => 'static_pages#about'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :students do 
    get :autocomplete_course_name, :on => :collection
    member do 
      get :newrequirecourse
      get :editrequirecourse
      post :createrequirecourse
      get :plan
      delete :destroyscs
 #     get :addplancourse
      post :addplancourse
    end
  end
 
 resources :courses 
end
