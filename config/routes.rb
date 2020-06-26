Rails.application.routes.draw do
  resources :cocktails, except: :index do
    resources :doses, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :doses, only: [:destroy]
  resources :reviews, only: [:destroy]
  root to: "cocktails#index"
end
