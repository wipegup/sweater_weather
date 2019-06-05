class Current
  attr_reader :time, :icon, :summary, :temperature, :apparentTemperature,
    :uvIndex, :visibility, :humidity
  def initialize(current)
     @time = current[:time]
     @icon = current[:icon]
     @summary = current[:summary]
     @temperature = current[:temperature]
     @apparentTemperature = current[:apparentTemperature]
     @uvIndex = current[:uvIndex]
     @visibility = current[:visibility]
     @humidity = current[:humidity]
  end
end
