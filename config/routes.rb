ActionController::Routing::Routes.draw do |map|
  Jammit::Routes.draw(map)

  map.resources :arquivos, :collection => { :new => :get, :create => :post }

  map.resources :mensagems

  map.resources :chamados, :collection => { 
                                            :meus_chamados => :get, :encaminhar => 
                                            :get, :abertos => :get, :em_atendimento => :get, 
                                            :meus_pendentes => :get, :grupo_pendentes => :get,
                                            :acompanhamento => :get, :todos => :get, :reabrir => :get }

  map.resources :tipo_chamados

  map.resources :sistemas, :collection => { :tipo_de_chamado => :get , :update_tipo_de_chamado => :post}

  map.resources :grupos,   :collection => { :usuarios => :get }

  map.logout    '/logout',   :controller => 'sessions', :action => 'destroy'
  map.login     '/login',    :controller => 'sessions', :action => 'new'
  map.register  '/register', :controller => 'usuarios', :action => 'create'
  map.signup    '/signup',   :controller => 'usuarios', :action => 'new'
  map.resources :usuarios,   :collection => { :cadastros => :get, :home => :get }

  map.resource :session

#:imprime_casamento_2_via => [:get, :post], :dados_casamento_2_via => [:get, :post],
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "sessions", :action => "index"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
