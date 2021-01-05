Rails.application.routes.draw do
  
  root 'pages#home'
  get 'articles/create'
  get 'articles/index'
  
end
