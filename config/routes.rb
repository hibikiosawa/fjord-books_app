Rails.application.routes.draw do
  get 'follow_follower/followings'
  get 'follow_follower/followers'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)

  resources :users do
    resource :follow_follower, only: [:create, :destroy]
    get 'followings' => 'follow_follower#followings', as: 'followings'
    get 'followers' => 'follow_follower#followers', as: 'followers'
  end
end
