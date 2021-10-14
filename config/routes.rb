Rails.application.routes.draw do
  root 'sessions#new'
  resource :session, only: [:new, :create]

  resources :user, only: [], param: :username do
    resources :annotations, only: [:index]
      resources :guid, only: [], param: :guid do
        resources :index, only: [:edit, :delete], param: :index
      end
  end
end
