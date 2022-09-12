# frozen_string_literal: true

# old code just in case i mess this up ;)
# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

#   resources :tasks, except: %i[new edit], param: :slug, defaults: { format: "json" }
#   resources :users, { only: %i(index) }

#   root "home#index"
#   get "*path", to: "home#index", via: :all
# end
Rails.application.routes.draw do
  constraints(lambda { |req| req.format == :json }) do
    resources :tasks, except: %i[new edit], param: :slug
    resources :users, only: %i[index create]
    resource :session, only: [:create, :destroy]
    resources :comments, only: :create
  end

  root "home#index"
  get "*path", to: "home#index", via: :all
end
