class Hourly
  attr_reader :hourly_info
  def initialize(forecast)
    @hourly_info = forecast[:data].map { |hash| HourlyInfo.new(hash) }
  end

end
