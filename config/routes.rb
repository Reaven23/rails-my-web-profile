Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "web", to: "pages#web"
  get "projet_web", to: "pages#projet_web"
  get "english", to: "pages#english"
  get "contact", to: "pages#contact"
end
