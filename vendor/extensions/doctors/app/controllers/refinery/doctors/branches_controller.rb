module Refinery
  module Doctors
    class BranchesController < ::ApplicationController

      before_filter :find_all_branches
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @branch in the line below:
        present(@page)
      end

      def show
        @branch = Branch.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @branch in the line below:
        present(@page)
      end

    protected

      def find_all_branches
        @branches = Branch.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/branches").first
      end

    end
  end
end
