module Refinery
  module Doctors
    class Doctor < Refinery::Core::BaseModel
      self.table_name = 'refinery_doctors'

      attr_accessible :prefix, :full_name, :bio, :specialty, :branch, :schedule, :location, :position, :dr_img, :dr_img_id

      acts_as_indexed :fields => [:prefix, :full_name, :bio, :specialty, :branch, :schedule, :location, :dr_img, :dr_img_id]
      alias_attribute :title, :full_name

      validates :prefix, :presence => true
      belongs_to :dr_img, :class_name => '::Refinery::Image'
      has_many :branches
    end
  end
end
