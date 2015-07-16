Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  # The following are needed to get access to 'change password', without
  # allowing full registration.  Sigh...
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
    patch 'users/:id' => 'devise/registrations#update', :as => 'user_registration'            
  end 
  resources :users
  resources :contact
  resources :listings, controller: 'events', as: 'events' do
    collection do
      get :search
      get :expired
    end
  end
end
