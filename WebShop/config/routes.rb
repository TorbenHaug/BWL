Rails.application.routes.draw do
  resources :news

  get 'search/search'

  resources :news

  resources :article_to_tags

  resources :menu_to_tags

  resources :bill_entries

  resources :bills

  resources :shopping_cart_entries

  resources :menus

  resources :article_structures

  resources :articles

  resources :tags

  resources :users

  get 'shoppingcard' => 'shopping_cart_entries#index'
  get 'create_test_data' => 'application#create_tests'
  get 'home' => 'news#index'
  root 'news#index'

  get 'signup' => 'users#new'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'search' => 'articles#search'
  get 'by_menu' => 'articles#by_menu'
  
  post 'add_to_shopping_card' => 'articles#add_to_shopping_card'
  post 'buy' => 'shopping_cart_entries#buy'
  get 'associations' => 'articles#association_analysis'
  
  get 'test_area_1' => 'application#test_area_1'
  get 'test_area_2' => 'application#test_area_2'
  get 'legal_information' => 'application#legal_information'
  get 'disclaimer' => 'application#disclaimer'
  get 'privacy_policy' => 'application#privacy_policy'

  get 'notyetimplemented' => 'static_pages#notyetimpemented'
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
