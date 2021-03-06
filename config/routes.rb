Tillmannheigel::Application.routes.draw do
  root "home#index"
  get "download/:id"=> "downloads#download", as:"download"
  get "info/info", as:"info"
  post "students/create" => "students#create", as:"create_student_as_admin"
  patch "students/update/:id" => "students#updateCourses", as:"update_students_courses"
  post "worksheet/contribute/:id" => "worksheets#contribute", as: "worksheet_contribute"
  delete "worksheets/:id" => "worksheets#deleteAttachment", as: "delete_attachment"
  get "students/send/:id"=> "students#sendMessage", as:"send_message"
  devise_for :admins
  devise_for :students
  devise_for :tutors
  resources :students
  resources :courses
  get "worksheets" => "worksheets#index", as:"worksheets"
  get "worksheets/edit/:id" => "worksheets#edit", as:"edit_worksheet" 
  get "worksheets/index" => "worksheets#index"
  get "worksheets/:id" => "worksheets#show", as:"worksheet"
  delete "worksheets/:id" => "worksheets#destroy", as: "delete_worksheet"
  patch "worksheets/:id" => "worksheets#update" 
  post "worksheets/new" => "worksheets#new", as:"new_worksheet"
  post "worksheets" => "worksheets#create"
  #post "sessions" => "sessions#create", as: "sessions"
  get "download/:id" => "downloads#download"
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
