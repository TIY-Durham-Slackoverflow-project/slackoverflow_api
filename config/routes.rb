Rails.application.routes.draw do
  scope path: "api" do
    resources :questions do
      resources :answers, only: [:create, :destroy]
    end
    resources :users, except: [:index] do
      collection do
        post :login
      end
    end
  end
end
