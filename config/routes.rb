EventsManager::Application.routes.draw do
  get 'tags/:tag', to: 'events#index', as: :tag
  resources :playlists, only: [:show]

  get 'search' => 'search#index'

  resources :tracks
  #get 'search' => 'events#search'
  get 'search_t' => 'tracks#search'

  devise_for :admins
  namespace :admin do
    resources :users
  end

  devise_for :users
  resources :comments, except: [:index, :show]
  resources :tags
  resources :events do
    get 'playlist' => 'events#playlist'
  end
  resources :participations, only: [:create, :destroy]
  resources :categories, only: [:index, :show]
  resources :profiles do
    get 'crp' => 'profiles#crp'
  end
  resources :photos do
    collection { post :sort }
  end

  root to: "static_pages#home"
  get 'about' => 'static_pages#about'
  get 'help' => 'static_pages#help'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
