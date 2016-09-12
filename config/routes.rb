Rails.application.routes.draw do
  resources :categories, only: [:index, :show] do
    resources :articles
  end

  root 'categories#index'
end
