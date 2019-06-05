namespace :forecasts do
  desc 'Stores Forecasts in Redis'
  task get: :environment do
    cities_csv = CSV.open('./top_cities.csv', headers: true)
    cities = cities_csv.map do |row|
      row[0..1].join(",")
    end

    cities.each do |c|
      puts c.downcase
      $redis.set(c.downcase, WeatherFacade.forecast(c.downcase))
    end
  end

end
