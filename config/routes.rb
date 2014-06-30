Rails.application.routes.draw do
  root :to => 'pages#search'
  post '/' => 'pages#search'
end
