Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'
  # resources :boards, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
  resources :boards  do
  resources :tasks
  
  　
  resource :profile, only: [:show, :edit, :update] do
  end