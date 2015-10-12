namespace :geocoding do
  desc 'Given an input CSV of zip codes, print a formatted address'
  task :by_zip => :environment do
    zips = File.open(ENV['infile'], 'r').readlines

    zips.each do |zip|
      address_data = Geocoder.search(zip).first.try(:address_data)
      next unless address_data
      puts "#{ address_data['locality'] }, #{ address_data['formattedAddress'] }"
    end
  end
end
