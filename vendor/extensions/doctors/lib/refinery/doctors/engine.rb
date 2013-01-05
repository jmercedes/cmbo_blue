module Refinery
  module Doctors
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Doctors

      engine_name :refinery_doctors

      initializer "register refinerycms_doctors plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "doctors"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.doctors_admin_doctors_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/doctors/doctor',
            :title => 'prefix'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Doctors)
      end
    end
  end
end
