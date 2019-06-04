require 'rails_helper'

describe 'rake task' do
  it 'populates redis with forecasts for top 50 cities' do

    Rails.application.load_tasks
    cities_csv = CSV.open('./top_cities.csv', headers: true)
    cities = cities_csv.map do |row|
      row[0..1].join(",")
    end
    #binding.pry

    cities.each do |city|
      expect($redis.get(city)).to eq(nil)
    end

    Rake::Task['forecasts:get'].execute

    cities.each do |city|
      expect($redis.get(city)).not_to eq(nil)
    end
  end
end
