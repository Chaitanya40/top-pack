Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # match "*all" => "application#cors_preflight_check", :constraints => { :method => "OPTIONS" }
  get '/search' => 'github_search#search' 
  post '/import' => 'github_search#import'
  get '/packages' => 'github_search#packages'
end
