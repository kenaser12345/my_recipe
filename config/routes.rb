Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :recipes do
    resources :steps do
    end
  end

  resources :ingredients
end
