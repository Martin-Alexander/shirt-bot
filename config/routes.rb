Rails.application.routes.draw do
  resources :slack_webhooks, only: :create
end
