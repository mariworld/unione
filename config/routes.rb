Rails.application.routes.draw do

  resources :characters, only: [:index,:new,:create,:edit,:update,:show,:destroy]
  

  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resources :groups, only: [:new, :create, :show, :update, :edit, :index, :destroy]
  # resources :groups do
  #   resources :posts, except: [:index], controller: "groups/posts"
  # end 
  resources :posts, only: [:index,:new,:create,:show, :destroy]
  #resources :posts, only: [:new, :create, :show, :update, :edit, :index]
  resources :comments, only: [:new, :create, :show, :update, :edit, :index]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  delete 'logout', to: 'sessions#destroy'
  get '/groups/:id/main_menu', to: 'groups#show'
  
  # get 'groups/index'
  # get 'groups/new'
  # get 'groups/create'
  # get 'groups/edit'
  # get 'groups/update'
  # get 'groups/destroy'
  # resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
