Rails.application.routes.draw do
  get '/' => 'home#index'  
  post '/' => 'home#create'  
  get '/register' => 'registers#index'
  post '/register' => 'registers#create'
  get '/room' => 'rooms#index'
end
