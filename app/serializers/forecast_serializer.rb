class ForecastSerializer

  def initialize(options = nil)
    options = default_options unless options
    @options = options
  end

  def self.from_darksky(darksky_json)
    # serialized = {}
    # options.keys each do |key|
    #   if key == :base
    #     get_base_data(options[:base], darksky_json)
    #   end
    #
    #   working = darksky_json[:key]
    #   working.keys each do |key2|
    #     if key2 == :base
    #
    #     end
    #   end
    # end

    {
      summary: darksky_json[:currently][:summary],
      current_temperature: darksky_json[:currently][:temperature]
    }
  end

  def default_options
    {
      base: {},
      currently: {
        base:{
          summary: nil, temperature: "current_temperature"
        }
      },
      minutely: {base:{}, data: {} },
      hourly: { base: {}, data: {} },
      daily: { base: {}, data: {} }
    }
  end

  private
  attr_reader :options
end
