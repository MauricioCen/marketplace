# frozen_string_literal: true

desc 'Update discount from excel'
task update_discounts: :environment do
  xlsx = Roo::Spreadsheet.open('lib/tasks/files/Descuentos.xlsx')
  xlsx.sheet('Sheet1').each(category: 'Categoría', discount: 'Descuento') do |hash|
    next if hash[:category] == 'Categoría'

    category = Category.find_by(name: hash[:category])
    category.products.each do |product|
      product.update!(discount: hash[:discount])
    end
  end
end
