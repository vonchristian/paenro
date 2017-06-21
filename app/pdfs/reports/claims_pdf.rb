module Reports
  class ClaimsPdf < Prawn::Document
    def initialize(orders, view_context)
      super(page_size: "LETTER", margin: 40)
      @orders = orders
      @view_context = view_context
      logo
      heading
      inventory_table
    end
    private
    def price(number)
      @view_context.number_to_currency(number, unit: "P ")
    end
    def logo
      image "#{Rails.root}/app/assets/images/paenro_logo.jpg", width: 60, height: 60, :at => [0, 715]
    end
    def heading
      text "Republic of the Philippines", align: :center, size: 10
      text "Province of Ifugao", align: :center, size: 10
      text "Cordillera Administrative Region", align: :center, size: 10
      move_down 2
      text "PROVINCIAL AGRICULTURE, ENVIRONMENT AND NATURAL RESOURCES OFFICE", align: :center, size: 10, style: :bold
      move_down 10



      text "CLAIMS REPORT", align: :center
      move_down 10
      stroke_horizontal_rule
    end
    def inventory_table
      if @orders.empty?
        move_down 20
        text "No claims found.", align: :center
      else
        table table_data,
        cell_style: { size: 8,  inline_format: true  }, column_widths: [70, 150, 100, 100, 100] do
          row(0).font_style = :bold
          column(8).align = :right
          column(9).align = :right
          column(10).align = :right
          column(11).align = :right



        end
      end
    end
    def table_data
      move_down 5
      [["DATE", "CLIENT", "PRODUCT", "QUANTITY", "TOTAL COST"]] +
      @table_data ||= @orders.map { |e| [e.order.date.strftime("%b %e, %Y"), e.order.client.try(:full_name), e.stock.product.name, e.quantity, price(e.total_cost)] }
    end
  end
end
