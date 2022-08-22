Rails.application.routes.draw do

  get 'followfollowers/followings'
  get 'followfollowers/followers'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)

  # ネストさせる
  resources :users do
    resource :followfollowers, only: [:create, :destroy]
    get 'followings' => 'followfollowers#followings', as: 'followings'
    get 'followers' => 'followfollowers#followers', as: 'followers'

  end
end