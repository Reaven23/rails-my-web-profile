Rails.application.routes.draw do
  root to: "pages#home"
  get "web", to: "pages#web"
  get "english", to: "pages#english"
  get "contact", to: "pages#contact"
  
  devise_for :users
end
