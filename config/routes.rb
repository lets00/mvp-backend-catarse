Rails.application.routes.draw do
  namespace :v1 do
    resources :project
    post '/login', to: 'auth#create'
    resources :support, only: [:show, :create]
    get '/user/:id', to:'user#show'
    get '/user/:id/projects', to: 'user#projects'
    get '/user/:id/supports', to: 'user#supports'
  end
end
