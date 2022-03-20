# frozen_string_literal: true

desc 'Create categories from excel'
task create_categories: :environment do
  xlsx = Roo::Spreadsheet.open('lib/tasks/files/Productos.xlsx')
  xlsx.sheet('Categorias').drop(1).each do |row|
    Category.create!(name: row.first)
  end
end
