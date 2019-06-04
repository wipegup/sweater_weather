namespace :forecasts do
  desc 'Stores Forecasts in Redis'
  task get: :environment do
    cities_csv = CSV.open('./top_cities.csv', headers: true)
    cities = cities_csv.map do |row|
      row[0..1].join(",")
    end

    cities.each do |c|
      puts c
      $redis.set(c, WeatherFacade.forecast(c))
    end
  end

end
