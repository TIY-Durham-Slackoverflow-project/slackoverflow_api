Rails.application.routes.draw do
  scope path: "api" do
    resources :users, except: [:index] do
      collection do
        post :login
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
