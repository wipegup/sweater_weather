require 'rails_helper'

describe 'rake task' do
  it 'populates redis with forecasts for top 50 cities' do
    $redis.flushdb
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    Rails.application.load_tasks
    cities_csv = CSV.open('./top_cities.csv', headers: true)
    cities = cities_csv.map do |row|
      row[0..1].join(",")
    end
    #binding.pry

    cities.each do |city|
      expect($redis.get(city.downcase)).to eq(nil)
    end

    Rake::Task['forecasts:get'].execute

    cities.each do |city|
      expect($redis.get(city.downcase)).not_to eq(nil)
    end
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
  end
end
