# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Doctors" do
    describe "Admin" do
      describe "doctors" do
        login_refinery_user

        describe "doctors list" do
          before do
            FactoryGirl.create(:doctor, :prefix => "UniqueTitleOne")
            FactoryGirl.create(:doctor, :prefix => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.doctors_admin_doctors_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.doctors_admin_doctors_path

            click_link "Add New Doctor"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Prefix", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Doctors::Doctor.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Prefix can't be blank")
              Refinery::Doctors::Doctor.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:doctor, :prefix => "UniqueTitle") }

            it "should fail" do
              visit refinery.doctors_admin_doctors_path

              click_link "Add New Doctor"

              fill_in "Prefix", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Doctors::Doctor.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:doctor, :prefix => "A prefix") }

          it "should succeed" do
            visit refinery.doctors_admin_doctors_path

            within ".actions" do
              click_link "Edit this doctor"
            end

            fill_in "Prefix", :with => "A different prefix"
            click_button "Save"

            page.should have_content("'A different prefix' was successfully updated.")
            page.should have_no_content("A prefix")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:doctor, :prefix => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.doctors_admin_doctors_path

            click_link "Remove this doctor forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Doctors::Doctor.count.should == 0
          end
        end

      end
    end
  end
end
