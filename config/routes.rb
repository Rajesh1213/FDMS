FinacialDataManagementSystem::Application.routes.draw do

  get "rents/download_rent_full_details_pdf"
  get "transactions/download_transaction_pdf"
  get "monthly_finances/download_track_record_pdf"
  get "monthly_finances/list"
  get "daily_finances/list"
  get "personal_finance/index"
  get "personal_finance/balance_sheet"
  get "personal_finance/income"
  get "personal_finance/expenses"
  match "/download_pdf(.:format)" => "home#index_pdf", :method => :get, :as=>:index_pdf

  resources :di_transactions

  resources :df_transactions

  resources :mi_utransactions

  resources :transactions

  resources :monthly_f_investments

  resources :rents_transactions

  get "home/index"
  post "customers/search_customer"
  get "customers/search_customer" => 'customers#search_customer'
  get "customers/loans_taken/:id" => 'customers#loans_taken'
  get "customers/all_customers"
  get "daily_finances/track_record"
  get "daily_finances/make_payment"
  get "daily_finances/dashboard"=> 'daily_finances#dashboard'
  get "daily_finances/confirm_payment"
  post "daily_finances/confirm_payment"
   
  get "monthly_finances/dashboard" => 'monthly_finances#dashboard' 
  get "monthly_finances/track_record"
  get "monthly_finances/make_payment"
  get "monthly_finances/confirm_payment"
  post "monthly_finances/search_customer"
  post "monthly_finances/confirm_payment"

  post "daily_finances/search_customer"
  post "dailyinterests/search_customer"
  post "monthly_interests/search_customer"

  get "dailyinterests/dashboard" => 'dailyinterests#dashboard'
  get "dailyinterests/track_record"
  get "dailyinterests/make_payment"
  get "dailyinterests/confirm_payment"
  post "dailyinterests/confirm_payment"

  get "monthly_interests/dashboard" => 'monthly_interests#dashboard'
  get "monthly_interests/track_record"
  get "monthly_interests/make_payment"
  get "monthly_interests/confirm_payment"
  post "monthly_interests/confirm_payment"

  

  get "customers/my_profile"
  get "home/settings"
  get "home/transactions"
 
  post "m_directors/ajax_post" => 'm_directors#ajax_post'
  get "m_directors/partners_list" => 'm_directors#partners_list'

  post "monthly_f_investments/update_partners"
  post "monthly_f_investments/update_partners_details"

  get "rents/dashboard" => 'rents#dashboard'
  get "rents/home" => 'rents#home'
  get "rents/view_rents"
  post "rents/search_properties"
  get "rents/search_properties" => 'rents#search_properties'
  get "rents/make_payment"
  get "rents/confirm_payment"
  post "rents/confirm_payment"
  get "rents/full_details"
  get "rents/extend_rent_contract"
  post "rents/extend_rent_contract"

  resources :add_properties
  
  resources :finance_outflows

  resources :finance_inflows

  resources :partners

  resources :m_directors

  resources :rents 

  resources :monthly_interests

  resources :dailyinterests

  resources :monthly_finances
  
  resources :daily_finances

  resources :customers

  resources :user

  devise_for :users


  devise_for :users do
    get 'logout' => 'devise/sessions#destroy'
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
