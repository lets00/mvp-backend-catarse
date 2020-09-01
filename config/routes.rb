Rails.application.routes.draw do
  namespace :v1 do
    resources :project
    post '/login', to: 'auth#create'
    get '/projects', to: 'projects#index'
  end
end
