# frozen_string_literal: true

desc 'Create banners from excel'
task create_banners: :environment do
  xlsx = Roo::Spreadsheet.open('lib/tasks/files/Imagenes.xlsx')
  xlsx.sheet('Banners').each(name: 'Nombre', url: 'URL', link: 'Link') do |hash|
    next if hash[:name] == 'Nombre'

    Banner.create!(hash)
  end
end
