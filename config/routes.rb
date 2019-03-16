Rails.application.routes.draw do

  root 'users#index'

  resources :roles, only: [:new, :create, :index] do
    post :hide, on: :collection
  end

  resources :users, only: [:new, :create, :index, :show]

  # if Rails.env.production?
  #   mount Shrine.presign_endpoint(:cache) => "/presign"
  # else
  #   mount Shrine.upload_endpoint(:cache) => "/upload"
  # end

end
