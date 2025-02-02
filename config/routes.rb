Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :categories, only: [ :index, :show ]

  # Routes de produits
  resources :products, only: [ :index, :show, :new, :create, :edit, :update ] do
    collection do
      get "search"
    end
    member do
      get "discount"
    end
  end

  # Routes de commandes
  resources :orders, only: [ :index, :show, :create ] do
    member do
      get "summary"
    end
  end

  # Routes d'administration
  namespace :admin do
    resources :products
    resources :orders
  end

  # Routes de fournisseurs
  resources :suppliers

  get "inventory_list", to: "inventory#index", as: :inventory_lists
end
