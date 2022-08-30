Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)

  resources :users do
    resource :follow_relationship, only: [:create, :destroy]
    get 'followings' => 'follow_relationship#followings', as: 'followings'
    get 'followers' => 'followe_relationship#followers', as: 'followers'

  end
end