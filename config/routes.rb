Rails.application.routes.draw do
  root 'welcome#index'
  resources :annotations, only: [:index, :edit, :destroy, :update], param: :coordinate
end
