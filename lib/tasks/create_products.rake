# frozen_string_literal: true

desc 'Create products from excel'
task create_products: :environment do
  xlsx = Roo::Spreadsheet.open('lib/tasks/files/Productos.xlsx')
  xlsx.sheet('Productos').each(name: 'Nombre', description: 'Descripción', price: 'Precio', discount: 'Descuento', stock: 'Stock',
                               category: 'Categoria') do |hash|
    next if hash[:name] == 'Nombre'

    category = Category.find_by(name: hash[:category])
    hash[:category_id] = category.id
    hash.delete(:category)
    Product.create!(hash)
  end
end
