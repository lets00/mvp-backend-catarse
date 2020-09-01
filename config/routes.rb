Rails.application.routes.draw do
  namespace :v1 do
    resources :project
    post '/login', to: 'auth#create'
  end
end
