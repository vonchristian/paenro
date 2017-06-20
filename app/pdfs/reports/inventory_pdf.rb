module Reports
  class InventoryPdf < Prawn::Document
    def initialize(products, view_context)
      super(page_size: "LETTER", margin: 40)
      @products = products
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
      text "PROVINCIAL AGRICULTURE AND ENVIRONMENT NATURAL RESOURCES OFFICE", align: :center, size: 10, style: :bold
      move_down 10


      text "INVENTORY REPORT", align: :center
      move_down 10
      stroke_horizontal_rule
    end
    def inventory_table
      if table_data.empty?
        text "No products found.", align: :center
      else
        table table_data,
        cell_style: { size: 8,  inline_format: true  }, column_widths: [230, 100, 100, 100] do
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
      [["PRODUCT", "DELIVERIES", "CLAIMED", "IN STOCK"]] +
      @table_data ||= @products.map { |e| [e.name, e.quantity, e.in_stock, e.claimed] }
    end
  end
end
