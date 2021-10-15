Rails.application.routes.draw do
  root 'sessions#new'
  resource :session, only: [:new, :create]

  resources :users, only: [], param: :username do
    resources :annotated_objects, only: [:index], param: :guid do
      resources :annotations, only: [:edit, :update, :destroy], param: :offset
    end
  end
end
