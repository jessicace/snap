Rails.application.routes.draw do

  resources :albums do
    resources :photos
  end

  #resources :photos, controller: 'all_photos', only [:index, :show]
  
end
