PostitTemplate::Application.routes.draw do
  root to: 'nodes#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/pin', to: 'sessions#pin'
  post '/pin', to: 'sessions#pin'
  post '/push', to: 'records#create'
  get 'wrong_mac_address', to: 'records#wrong'
  get 'upload_success', to: 'records#upload_success'

  # resources :posts, except: [:destroy] do
  #   member do
  #     post 'vote'
  #   end

  #   resources :comments, only: [:create] do
  #     member do
  #       post 'vote'
  #     end
  #   end
  # end


  get '/cnet', to: 'nodes#index'
  get '/week', to: 'records#week'
  # resources :categories, except: [:destroy] 
  resources :users, only: [:create, :edit, :show, :update]
  resources :macs, only: [:show]
end