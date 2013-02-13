Bioduino::Application.routes.draw do
  resources :datapoints


  resources :experiments
  match "/current" => "experiments#current"

  root :to => "home#index"

end
