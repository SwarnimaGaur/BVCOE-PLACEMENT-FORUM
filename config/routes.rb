Rails.application.routes.draw do
 

  get 'upvote/create'

  get 'upvote/destroy'

  get 'comment/create'

  get 'comment/destroy'

  # devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }

   root 'home#index' 
   post 'search' => 'experience#search'
   get 'search' => 'experience#search'
   get 'share' => 'experience#share_exp'
   get 'browse' => 'experience#browse_exp'
   get 'home' => 'home#index'
   post 'create' =>'experience#create', as: 'experiences' 
   # get '/experience/destroy' =>'experience#destroy'
   delete '/experience/destroy' =>'experience#destroy'
  get 'experience/:id/edit' => 'experience#edit' , as: :edit_experience 
  post 'experience/:id', to: 'experience#update'
   post 'share' => 'home#share'
   post 'comment/create' => 'comment#create'
   post 'browse' => 'comment#create'
   post 'upvote/create' => 'upvote#create'
  post  'upvote/destroy' => 'upvote#destroy'


   delete '/comment/destroy' =>'comment#destroy'

  post 'answer/create' => 'answer#create'
  delete 'answer/destroy' => 'answer#destroy'
  post 'upvote/createAns' => 'upvote#createAns'
  post  'upvote/destroyAns' => 'upvote#destroyAns'

  post 'question/update' => 'question#update'
  get 'question/:id/edit' => 'question#edit' , as: :edit_question
  get 'question/ask' => 'question#ask'
  post 'question/create' => 'question#create'
  get 'question/QnA' =>'question#QnA'
  delete 'question/destroy' => 'question#destroy'


  
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
