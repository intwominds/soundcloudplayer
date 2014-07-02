Rails.application.routes.draw do
  root :to => 'pages#search'
  post '/' => 'pages#search'
  get '/users/:id' => 'pages#user', :as => 'user'
end
