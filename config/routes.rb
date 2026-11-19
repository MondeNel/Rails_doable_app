Rails.application.routes.draw do
  resources :todos

  # resources :projects => we could use this approach which would do everything below

  get "projects", to: "projects#index" # this would create a path to the index action of ProjectsController
  get "/projects/new", to: "projects#new", as: "new_project" # this would go to the Projects controller and hit the action method 'new' and the 'new_project' is our helper method projects path

  get "/projects/:id", to: "projects#show", as: "project" # this would create a show individual item on the screen and points to the show method in the ProjectsController

  get "/projects/:id/edit", to: "projects#edit", as: "edit_project" # this would allow us to edited a single item by triggering the id of that item

  post "/projects", to: "projects#create" # this points to the ProjectsController and target the create action method

  patch "/projects/:id", to: "projects#update"

  delete "projects/:id", to: "projects#destroy"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
