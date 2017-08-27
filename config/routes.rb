Rails.application.routes.draw do
  get 'access/login';
  post 'access/getAuthentication';

  get 'home/index';

  root 'home#index';
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
