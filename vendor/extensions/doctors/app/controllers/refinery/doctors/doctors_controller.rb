module Refinery
  module Doctors
    class DoctorsController < ::ApplicationController

      before_filter :find_all_doctors
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @doctor in the line below:

        present(@page)
      end

      def show
        @doctor = Doctor.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @doctor in the line below:
        present(@page)
      end

    protected

      def find_all_doctors
        @doctors = Doctor.order('branch ASC').paginate(:page => params[:page], :per_page => 20)
        
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/doctors").first
      end
      
      def branch
        present(@page)
      end

    end
  end
end
