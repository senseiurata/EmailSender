Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    post "send_email", to: "emails#send_email"
  end
end
