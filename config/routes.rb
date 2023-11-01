Rails.application.routes.draw do
  # resources :customers

  # resources :cheffs do
  #   collection do
  #     get 'filter', to: 'cheffs#filter_cheffs'
  #   end
  # end

  resources :cheffs

  resources :customers do
    collection do
      get 'show_chefs', to: 'customers#show_chefs'
    end
  end

  get 'login/index'
  root 'login#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
