Rails.application.routes.draw do
  root 'welcome#index'
  resources :annotations, only: [:index]
end
