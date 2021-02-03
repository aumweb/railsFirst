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
  
end
