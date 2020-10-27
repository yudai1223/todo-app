Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'
  # resources :board, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
  resources :boards do
  end
  resources :tasks do
  end

end


