class ProductsPdf < Prawn::Document
  TABLE_WIDTHS = [230, 100, 100, 100]
  def initialize(products, view_context)
    super(margin: 40, page_size: [612, 1008], page_layout: :portrait)
    @products = products
    @view_context = view_context
    heading
    display_products_table
  end

  def price(number)
    @view_context.number_to_currency(number, :unit => "")
  end

  def heading
    text "PAENRO IFUGAO", style: :bold, size: 10, align: :center
    text "Lagawe, Ifugao", size: 10, align: :center
    move_down 15
    text 'CURRENT INVENTORY REPORT', size: 12, align: :center
    move_down 5
    stroke_horizontal_rule
  end

  def display_products_table
    if @products.blank?
      move_down 10
      text "No products data.", align: :center
    else
      move_down 10

      table(table_data, header: true, cell_style: { size: 10, font: "Helvetica"}, column_widths: TABLE_WIDTHS) do
        row(0).font_style = :bold
        row(0).background_color = 'DDDDDD'
        column(1).align = :right
        column(2).align = :right
        column(3).align = :right
        column(4).align = :right
        column(5).align = :right


      end
    end
  end

  def table_data
    move_down 5
    [["PRODUCT",  "DELIVERIES", "IN STOCK", "CLAIMED"]] +
    @table_data ||= @products.map { |e| [e.name, price(e.quantity), price(e.in_stock), price(e.claimed) ]}
  end
end
