Rails.application.routes.draw do
  root :to => 'pages#search'
  post '/' => 'pages#search'
  get '/users/:id' => 'pages#user', :as => 'user'
  resources :accounts

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end

#         root GET    /                            pages#search
#              POST   /                            pages#search
#         user GET    /users/:id(.:format)         pages#user

#     accounts GET    /accounts(.:format)          accounts#index
#              POST   /accounts(.:format)          accounts#create
#  new_account GET    /accounts/new(.:format)      accounts#new
# edit_account GET    /accounts/:id/edit(.:format) accounts#edit
#      account GET    /accounts/:id(.:format)      accounts#show
#              PATCH  /accounts/:id(.:format)      accounts#update
#              PUT    /accounts/:id(.:format)      accounts#update
#              DELETE /accounts/:id(.:format)      accounts#destroy

#        login GET    /login(.:format)             session#new
#              POST   /login(.:format)             session#create
#              DELETE /login(.:format)             session#destroy
