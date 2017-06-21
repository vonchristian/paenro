module Reports
  class ClaimsReportsController < ApplicationController
    def index
      @orders = Orders::LineItem.all
      respond_to do |format|
        format.html
        format.pdf do
          pdf = Reports::ClaimsPdf.new(@orders, view_context)
          send_data pdf.render, type: "application/pdf", disposition: 'inline', file_name: "Claims Report.pdf"
        end
      end
    end
  end
end
