# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, only: :omniauth_callbacks, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope "(:locale)" do
    resources :books
    devise_for :users, skip: :omniauth_callbacks, controllers: {
      registrations: "users/registrations",
      sessions: "users/sessions",
      confirmations: "users/confirmations"
    }
  end
end
