Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  root "pages#index"
  # get '/*a', to: 'application#not_found'

  scope:'api/V1' do
    post '/auth/login', to: 'authentication#login'
    resources :users, except: [:show, :edit, :update]
    namespace :admin do
      resources :users, only: [:show, :edit, :update]
      patch 'patchuser/:id', to: 'users#adminpatch'
      get 'user', to: 'users#thisuser'
      resources :pages, except: [:show, :index, :pdf] do
        resources :comments, except: [:show, :index]
      end
    end
    # get 'panel', to: 'admin#panel'
    # get 'panel/users', to: 'admin#users'
    # get 'panel/pages', to: 'admin#pages'
    # get 'panel/pages/:id/comments', to: 'admin#comments'
    # get 'panel/users/:id/destroy', to: 'admin#destroyuser', as: 'panel_users_destroy'
    resources :pages, only: [:show, :index, :pdf] do
      resources :comments, only: [:show, :index]
    end
  end

  get 'page/pdf/:id', to: 'pages#pdf', as: "page_pdf_path"

  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
end
