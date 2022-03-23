# frozen_string_literal: true

desc 'update products from excel'
task update_products: :environment do
  xlsx = Roo::Spreadsheet.open('lib/tasks/files/productos_23_03_2022.xlsx')
  xlsx.sheet('Productos').each(name: 'Nombre', description: 'Descripción', price: 'Precio', discount: 'Descuento', stock: 'Stock',
                               category: 'Categoria') do |hash|
    next if hash[:name] == 'Nombre'

    product = Product.find_by(name: hash[:name])
    category = Category.find_by(name: hash[:category])
    hash[:category_id] = category.id
    hash.delete(:category)
    if product.nil?
      Product.create(hash)
    else
      product.update!(hash)
    end
  end
end
