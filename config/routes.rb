Rails.application.routes.draw do
  root to: "pages#home"
  get "web", to: "pages#web"
  get "projet_web", to: "pages#projet_web"
  get "english", to: "pages#english"
  get '/telecharger-cv', to: 'cvchargers#telecharger_cv', as: 'telecharger_cv'
  resources :contact, only: %i[new create]
end
