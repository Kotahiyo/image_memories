Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
  }

  root to: "api/v1/posts#index"
  namespace "api" do
    namespace "v1" do
      resources :posts, defaults: { format: :json }
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
