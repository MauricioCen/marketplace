# frozen_string_literal: true

desc 'Generate excel from stock products'
task generate_excel_products_stock: :environment do
  p = Axlsx::Package.new
  p.workbook.add_worksheet(name: 'Productos') do |sheet|
    sheet.add_row %w[Producto Inventario Descuento Precio Categoria]
    Product.order(stock: :asc).limit(5).each do |product|
      sheet.add_row [product.name, product.stock, product.discount, product.price, product.category.name]
    end
  end
  p.serialize('generar excel inventario.xlsx')
end
