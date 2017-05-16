Rails.application.routes.draw do
 
  get 'page/new', to: 'posts#new', as: 'posts'
  get 'page/:id', to: 'posts#show', as: 'post'
  post 'page/new', to: 'posts#create'
  get 'page/:id/edit', to: 'posts#edit', as: 'post_edit'
  patch 'page/:id', to: 'posts#update'
  get 'page', to: 'posts#index'
  delete 'page/:id', to: 'posts#destroy'

  get '/apply', to: 'playerapplication#new'
  get 'application/:id', to: 'playerapplication#show', as: 'playerapplication'
  post 'apply', to: 'playerapplication#create', as: 'playerapplications'

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
