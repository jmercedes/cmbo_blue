# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Doctors" do
    describe "Admin" do
      describe "branches" do
        login_refinery_user

        describe "branches list" do
          before do
            FactoryGirl.create(:branch, :name => "UniqueTitleOne")
            FactoryGirl.create(:branch, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.doctors_admin_branches_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.doctors_admin_branches_path

            click_link "Add New Branch"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Doctors::Branch.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Doctors::Branch.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:branch, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.doctors_admin_branches_path

              click_link "Add New Branch"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Doctors::Branch.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:branch, :name => "A name") }

          it "should succeed" do
            visit refinery.doctors_admin_branches_path

            within ".actions" do
              click_link "Edit this branch"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:branch, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.doctors_admin_branches_path

            click_link "Remove this branch forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Doctors::Branch.count.should == 0
          end
        end

      end
    end
  end
end
