Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :doctors do
    resources :doctors, :path => '', :only => [:index, :show, :branch]
  end

  # Admin routes
  namespace :doctors, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :doctors, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
