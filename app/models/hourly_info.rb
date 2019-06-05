class HourlyInfo
  attr_reader :time, :icon, :temperature
  def initialize(hash)

    @time = hash[:time]
    @icon = hash[:icon]
    @temperature = hash[:temperature]
  end
end
