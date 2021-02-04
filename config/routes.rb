Rails.application.routes.draw do
  
  
  resources :blogs
  resources :articles
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  resources :users
  get 'login', to: 'sessions#new'
  post  'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'category', to: 'category#index'
  get 'category/new', to: 'category#new'
  get 'category/:id/edit', to: 'category#edit'
  delete 'category/:id', to: 'category#destroy'
  post 'category/create', to: 'category#create'
  patch 'category/:id/update', to: 'category#update'
  
end
