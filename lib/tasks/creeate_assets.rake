# frozen_string_literal: true

desc 'Create assets from excel'
task create_assets: :environment do
  xlsx = Roo::Spreadsheet.open('lib/tasks/files/Imagenes.xlsx')
  xlsx.sheet('Productos').each(name: 'Nombre', url: 'URL', product: 'Producto') do |hash|
    next if hash[:name] == 'Nombre'

    product = Product.find_by(name: hash[:product])
    hash[:product_id] = product.id
    hash.delete(:product)
    Asset.create!(hash)
  end
end
