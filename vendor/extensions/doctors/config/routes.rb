Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :doctors do
    resources :branches, :only => [:index, :show]
  end

  # Admin routes
  namespace :doctors, :path => '' do
    namespace :admin, :path => 'refinery/doctors' do
      resources :branches, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :doctors do
    resources :doctors, :path => '', :only => [:index, :show]
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
