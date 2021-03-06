Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :questions, only: [:index, :show, :new, :create] do
    resources :answers, only: [:index, :create, :destroy]
  end
end
