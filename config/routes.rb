Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)

  resources :users do
    resource :followfollowers, only: [:create, :destroy]
    get 'followings' => 'followfollowers#followings', as: 'followings'
    get 'followers' => 'followfollowers#followers', as: 'followers'

  end
end