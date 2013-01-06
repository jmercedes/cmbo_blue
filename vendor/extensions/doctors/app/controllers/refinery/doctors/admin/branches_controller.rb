module Refinery
  module Doctors
    module Admin
      class BranchesController < ::Refinery::AdminController

        crudify :'refinery/doctors/branch',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
