Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, only: %i[new create show]
  resources :sessions, only: %i[new create destroy]

  resources :events, only: %i[index new create show] do
    resources :event_attendances, only: %i[create]
  end
end
