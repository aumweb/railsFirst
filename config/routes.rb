Rails.application.routes.draw do
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'articles/create'
  get 'articles/index'
  
end
