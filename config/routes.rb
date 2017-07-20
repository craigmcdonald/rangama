Rails.application.routes.draw do
  root to: 'home#index'
  post '/search', to: 'home#search'
  post '/upload', to: 'home#upload'
  get '/clear',   to: 'home#clear'
end
