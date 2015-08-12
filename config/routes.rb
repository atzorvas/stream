Rails.application.routes.draw do
  devise_for :users
  resources :streams do
    get '/playlist' => 'streams#playlist'
  end
  root 'streams#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
