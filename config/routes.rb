Rails.application.routes.draw do
  get 'special_courses/show'

  get 'courses/show'

  get 'course/show'

  get 'sessions/new'

  root 'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'help'   => 'static_pages#help'
  get 'contact'   => 'static_pages#contact'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :students do 
    get :autocomplete_course_name, :on => :collection
    member do 
      get :required_courses
      post :create_required_courses
      get :interest_courses
      post :create_interest_courses
      get :plan
      delete :destroy_scs_ship
      delete :destroy_sscs_ship
      
      post :add_plan_courses
      post :add_special_courses
      

    end
  end
 
 resources :courses 
 resources :special_courses
end
