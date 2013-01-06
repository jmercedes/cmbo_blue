module Refinery
  module Doctors
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Doctors

      engine_name :refinery_doctors

      initializer "register refinerycms_branches plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "branches"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.doctors_admin_branches_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/doctors/branch',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/doctors/branches(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Branches)
      end
    end
  end
end
