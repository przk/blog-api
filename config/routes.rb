Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  # root "/api/v1/pages#index"
  # get '/*a', to: 'application#not_found'

  namespace :api do
    namespace :v1 do
    post '/auth/login', to: 'authentication#login'
    resources :users, except: [:show, :edit, :update]
    namespace :admin do
      resources :users, only: [:show, :edit, :update]
      patch 'patchuser/:id', to: 'users#adminpatch'
      get 'user', to: 'users#thisuser'
      resources :pages, except: [:show, :index] do
        resources :comments, except: [:show, :index]
      end
    end
    resources :pages, only: [:show, :index] do
      resources :comments, only: [:show, :index]
    end
  end
end

  # get 'page/pdf/:id', to: 'pages#pdf', as: "page_pdf_path"

  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
end
