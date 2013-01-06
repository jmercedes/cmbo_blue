module Refinery
  module Doctors
    class Branch < Refinery::Core::BaseModel

      attr_accessible :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
      #belongs_to :doctor
    end
  end
end
