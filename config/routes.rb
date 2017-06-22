Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sub_reddit_comments
      resources :sub_reddit_posts
      resources :sub_reddits
    end
  end
  resources :sub_reddit_comments
  resources :sub_reddit_posts
  resources :sub_reddits
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
