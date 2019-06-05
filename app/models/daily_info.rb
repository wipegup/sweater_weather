class DailyInfo
  attr_reader :icon, :precipProbability, :temperatureHigh, :temperatureLow
  def initialize(hash)
    @icon = hash[:icon]
    @precipProbability = hash[:precipProbability]
    @temperatureHigh = hash[:temperatureHigh]
    @temperatureLow = hash[:temperatureLow]
  end

end
