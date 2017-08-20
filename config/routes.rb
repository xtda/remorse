Rails.application.routes.draw do

  get 'page/new', to: 'posts#new', as: 'posts'
  get 'page/:id', to: 'posts#show', as: 'post'
  post 'admin/newpost', to: 'posts#create'
  get 'page/:id/edit', to: 'posts#edit', as: 'post_edit'
  patch 'page/:id', to: 'posts#update'
  get '/admin/page', to: 'posts#index', as: 'page'
  delete 'page/:id', to: 'posts#destroy'
  get '/admin/feature', to: 'posts#feature_edit', as: 'feature'

  get '/apply', to: 'playerapplication#new'
  get 'application/:id', to: 'playerapplication#show', as: 'playerapplication'
  delete 'application/:id', to: 'playerapplication#destroy'
  get '/admin/applications', to: 'playerapplication#index', as: 'applications'
  post 'apply', to: 'playerapplication#create', as: 'playerapplications'

  get '/admin/recruitment', to: 'recruitment#index', as: 'recruitment'
  patch '/admin/recruitment', to: 'recruitment#update'

  get '/roster', to: 'roster#index', as: 'roster'
  get '/roster/update', to: 'roster#new', as: 'roster_update'
  #get 'roster/show', to: 'roster#show'

  namespace :admin do
    resources :users
    resources :rosters
    root to: 'users#index'
  end

  scope module: 'api' do
    namespace :v1 do
      get 'health', to: 'health#index'
      get 'app/:realm/:char', to: 'guildapp#show'
      get 'recuriting', to: 'guildapp#recruiting'
      get 'roster', to: 'roster#index'
    end
  end

  root 'home#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
