module Refinery
  module Doctors
    module Admin
      class DoctorsController < ::Refinery::AdminController

        crudify :'refinery/doctors/doctor',
                :title_attribute => 'prefix', :xhr_paging => true,
                                              :order => "branch ASC",
                                              :sortable => false
                

      end
    end
  end
end
