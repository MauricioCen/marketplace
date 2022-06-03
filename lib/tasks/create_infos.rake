# frozen_string_literal: true

desc 'Create information'
task create_infos: :environment do
  table = CSV.parse(File.read('lib/tasks/files/infos.csv'), headers: true)

  table.each do |row|
    hash = { name: row['Nombre'], description: row['Descripción'], phone_number: row['Número'], email: row['Email'] }
    Information.create!(hash)
  end
end
