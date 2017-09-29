Rails.application.routes.draw do
  scope path: "api" do
    resources :questions do
      resources :votes, only: [:create]
      resources :answers, only: [:create, :destroy] do
        resources :votes, only: [:create]
      end
    end
    resources :users, except: [:index] do
      collection do
        post :login
        post :logout
      end
    end
  end
end
