Rails.application.routes.draw do
  
  resources :blogs
  resources :articles
  root 'pages#home'
  get 'about', to: 'pages#about'
  
  
end
