require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq' if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users
  devise_for :models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'articles#index'

  resources :articles do
    resources :comments, only: [:index, :new, :create]

    resource :like, only: [:create, :destroy, :show]
  end
  
  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  

  scope module: :apps do
    resources :favorites, only: [:index]
    resource :profile, only: [:show, :edit, :update]
    resource :timeline, only: [:show]
  end

  namespace :api, defaults: {format: :json} do
    scope '/articles/:article_id' do
      resources :comments, only: [:index, :create]
      resource :like, only: [:create, :destroy, :show]
    end
  end
end
