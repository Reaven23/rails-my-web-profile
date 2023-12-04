Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "web", to: "pages#web"
  get "projet_web", to: "pages#projet_web"
  get "english", to: "pages#english"
  get "contact", to: "pages#contact"
  get '/telecharger-cv', to: 'cvchargers#telecharger_cv', as: 'telecharger_cv'
  resources :contacts, only: %i[new create]
  resources :contact, only: [:create]
end
