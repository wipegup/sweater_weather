class Daily
  attr_reader :daily_info, :summary
  def initialize(daily)
    @summary = daily[:summary]
    @daily_info = daily[:data].map{ |hash| DailyInfo.new(hash)}
  end
end
