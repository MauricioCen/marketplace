# frozen_string_literal: true

desc 'Generate excel from products'
task generate_excel_products: :environment do
  p = Axlsx::Package.new
  p.workbook.add_worksheet(name: 'Productos') do |sheet|
    sheet.add_row %w[Producto Inventario Descuento Categoria]
    Product.order(discount: :desc).limit(5).each do |product|
      sheet.add_row [product.name, product.stock, product.discount, product.category.name]
    end
  end
  p.serialize('generar excel descuento.xlsx')
end
