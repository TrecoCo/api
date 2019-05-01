# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :authentication, controller: 'authentication', only: %i[create]
      resources :users, only: %i[create update destroy]
    end
  end
end
