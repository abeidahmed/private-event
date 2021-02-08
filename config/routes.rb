Rails.application.routes.draw do
  root 'static_pages#home'
  resources :users, only: %i[new create show]
end
