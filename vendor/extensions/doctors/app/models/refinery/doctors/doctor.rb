module Refinery
  module Doctors
    class Doctor < Refinery::Core::BaseModel
      self.table_name = 'refinery_doctors'

      attr_accessible :prefix, :full_name, :bio, :specialty, :branch, :schedule, :location, :position

      acts_as_indexed :fields => [:prefix, :full_name, :bio, :specialty, :branch, :schedule, :location]

      validates :prefix, :presence => true
      has_many :branches
    end
  end
end
