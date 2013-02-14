Bioduino::Application.routes.draw do
  resources :datapoints


  resources :experiments
  match "/current" => "experiments#current"
  match "/experiments/raw_data/:id" => "experiments#raw_data", :as => :raw_data
  root :to => "home#index"

end
