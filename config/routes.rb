AveRails::Application.routes.draw do
  match '/',  :to => 'pages#home'
  match 'settings' => "users#edit",						:as => :settings
  match 'designers' => "users#index", 				:as => :designers
  match 'upload' => "collections#new", 			  :as => :upload
  match 'projects' => "projects#index",       :as => :projects
  match 'login' => "user_sessions#new",       :as => :login
  match 'logout' => "user_sessions#destroy",  :as => :logout
  match 'signup' => 'users#new', 							:as => :signup

  resources :user_sessions
  resources :projects 

  resources :collections do
      member do
        post :request
      end
  end
  
  resources :submissions do
      member do
        post :request
      end
  end

  resources :attachments
  resources :looks

  resources :users do
      member do
        post :follow
        post :unfollow
        get :following, :followers
      end
  end
  resources :relationships, :only => [:create, :destroy]
	resource  :user, :as => 'account'  # Convenience route

  root :to => 'pages#home'
end
