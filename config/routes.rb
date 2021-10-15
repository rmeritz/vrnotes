Rails.application.routes.draw do
  root 'sessions#new'
  resource :session, only: [:new, :create]

  resources :user, only: [], param: :username do
    resources :annotations, only: [:index]
    resources :guid, only: [], param: :guid do
      resources :annotations, only: [:edit, :destroy], param: :offset
    end
  end
end
