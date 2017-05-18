Rails.application.routes.draw do

  get 'page/new', to: 'posts#new', as: 'posts'
  get 'page/:id', to: 'posts#show', as: 'post'
  post 'page/new', to: 'posts#create'
  get 'page/:id/edit', to: 'posts#edit', as: 'post_edit'
  patch 'page/:id', to: 'posts#update'
  get 'page', to: 'posts#index'
  delete 'page/:id', to: 'posts#destroy'
  get '/admin/feature', to: 'posts#feature_edit', as: 'feature'

  get '/apply', to: 'playerapplication#new'
  get 'application/:id', to: 'playerapplication#show', as: 'playerapplication'
  delete 'application/:id', to: 'playerapplication#destroy'
  get 'applications', to: 'playerapplication#index'
  post 'apply', to: 'playerapplication#create', as: 'playerapplications'

  get '/admin/recruitment', to: 'recruitment#index', as: 'recruitment'
  patch '/admin/recruitment', to: 'recruitment#update'

  namespace :admin do
    resources :users
    root to: 'users#index'
  end

  #constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
        get 'health', to: 'health#index'
        get 'app/:char/:realm', to: 'guildapp#show'
        get 'recuriting', to: 'guildapp#recruiting'
      end
    end
  #end

  root 'home#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
