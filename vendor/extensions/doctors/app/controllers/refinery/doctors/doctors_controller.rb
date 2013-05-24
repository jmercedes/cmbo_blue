module Refinery
  module Doctors
    class DoctorsController < ::ApplicationController

      before_filter :find_all_doctors
      before_filter :find_page
      before_filter :find_all_doctors_by_letter

      def index
        #@doctor = Doctor.find(params[:id])
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

      def find_all_doctors_by_speciality
        if !params[:find_speciality_doctors].blank?
          @selected_speciality_doctors = params[:find_speciality_doctors]
          @doctors = Doctor.where(:specialty => "#{params[:find_speciality_doctors]}")
          @doctors = @doctors.paginate(:page => params[:page], :per_page => 40)
        else
          @doctors = Doctor.order('branch ASC').paginate(:page => params[:page], :per_page => 40)
        end

        render "index"
      end

      protected
      def find_all_doctors
        if params[:letter]
          @doctors = Doctor.where("full_name like '#{params[:letter]}%'")
          @doctors = @doctors.paginate(:page => params[:page], :per_page => 20)
        else
          @doctors = Doctor.order('branch ASC').paginate(:page => params[:page], :per_page => 20)
        end

        @all_doctors = Doctor.all
        @doctor_speciality = []
        @all_doctors.each do |doctor|
          @doctor_speciality << doctor.specialty
        end
        @all_doctor_speciality = @doctor_speciality.uniq

        #@doctors = Doctor.order('branch ASC').paginate(:page => params[:page], :per_page => 10)
      end

      def find_all_doctors_by_letter
        @Doctors = Doctor.all(:conditions => "full_name like 'A%'")
        #@doctors = Doctor.order('ASC').paginate(:page => params[:page], :per_page => 20)        
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/doctors").first
      end
      
      def branch
        present(@page)
      end
      
      def glossary
        @glosssary = Doctor.find_all.where("name like '#{letter}%'")
      end

    end
  end
end
