require 'spec_helper'

module Refinery
  module Doctors
    describe Doctor do
      describe "validations" do
        subject do
          FactoryGirl.create(:doctor,
          :prefix => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:prefix) { should == "Refinery CMS" }
      end
    end
  end
end
