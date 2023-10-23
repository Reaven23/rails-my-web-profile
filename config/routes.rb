Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "web", to: "pages#web"
  get "english", to: "pages#english"
  get "contact", to: "pages#contact"
end
