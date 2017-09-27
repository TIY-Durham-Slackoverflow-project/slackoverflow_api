Rails.application.routes.draw do
  scope path: "api" do
    resources :questions
    resources :users, except: [:index] do
      collection do
        post :login
      end
    end
  end
end
