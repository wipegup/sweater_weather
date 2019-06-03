class ForecastSerializer

  def initialize(options = nil):
    options = default_options unless options
    @options = options
  end

  def self.from_darksky(darksky_raw)
    
  end

  def default_options
    {
      currently: %i(summary temperature),
      minutely: {base:[], data: [] },
      hourly: { base: [], data: [] },
      daily: { base: [], data: [] }
    }
  end
end
