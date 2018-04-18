Rails.application.routes.draw do
  
  get 'orderitems/index'

  get 'orderitems/show'

  get 'orderitems/new'

  get 'orderitems/edit'

  resources :orders do
      resources:orderitems
  end
  
  resources :consoles
  resources :genres
  
  
  devise_for :users do
      
      resources:orders
end
    
    
get '/checkout' , to: 'cart#createOrder'
    
  get 'cart/index'
 

  resources :items
  
  root 'static_pages#home'

  get 'static_pages/home'

  get '/about', to: 'static_pages#about'

  get '/help', to: 'static_pages#help'
  
  get '/login', to: 'user#login'
  get '/logout', to: 'user#logout'
  
   get '/cart', to: 'cart#index'
   get '/cart/clear', to: 'cart#clearCart'
   get '/cart/:id', to: 'cart#add'
   get '/cart/remove/:id', to: 'cart#remove'
   
   root :to => 'site#home'
   
   get 'genre/:title', to:'static_pages#genre'
   get 'console/:title', to:'static_pages#console'
   
   
  
   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
