Rails.application.routes.draw do
  get 'followfollower/followings'
  get 'followfollower/followers'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)

  resources :users do
    resource :followfollower, only: [:create, :destroy]
    get 'followings' => 'followfollower#followings', as: 'followings'
    get 'followers' => 'followfollower#followers', as: 'followers'
  end
end
