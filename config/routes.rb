Rails.application.routes.draw do

  get 'page/new', to: 'posts#new', as: 'posts'
  get 'page/:id', to: 'posts#show', as: 'post'
  post 'page/new', to: 'posts#create'
  get 'page/:id/edit', to: 'posts#edit', as: 'post_edit'
  patch 'page/:id', to: 'posts#update'
  get 'page', to: 'posts#index'
  delete 'page/:id', to: 'posts#destroy'

  #get 'posts/create'
  #get 'posts/destroy'
  #get 'posts/edit'

  namespace :admin do
    resources :users
    root to: 'users#index'
  end

  root 'home#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
