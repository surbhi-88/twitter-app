Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  resources :tweets, only: [:index, :create] do
    collection do
      get :user_tweets
    end
  end

  resources :follows, only: [] do
    collection do
      post :follow
      delete :unfollow
    end
  end
end
