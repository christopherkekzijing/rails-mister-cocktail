Rails.application.routes.draw do
  resources :cocktails, except: :index do
  resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]
  root to: "cocktails#index"
end
