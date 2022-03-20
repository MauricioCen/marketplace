# frozen_string_literal: true

desc 'Create categories from excel'
task create_categories: :environment do
  xlsx = Roo::Spreadsheet.open('lib/tasks/files/Productos.xlsx')
  xlsx.sheet('Categorias').each(name: 'Nombre') do |hash|
    next if hash[:name] == 'Nombre'

    Category.create!(hash)
  end
end
