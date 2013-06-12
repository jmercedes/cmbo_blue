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
    #match '/doctors/glossary/:id' => 'doctors#glossary'
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

  match "/doctors" => "doctors/doctors#find_all_doctors_by_speciality" , :as => :find_all_doctors_by_speciality
  
  #match doctors by branch
  match "/doctors" => "doctors/doctors#find_all_doctors_by_branch" , :as => :find_all_doctors_by_branch
end
