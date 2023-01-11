Rails.application.routes.draw do
  get 'weathers/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "weathers#show"
end
