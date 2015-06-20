class FutureCondition

  def initialize(zip_code = 34102)
    @zip_code = zip_code
  end

  def title
    future_weather['trip']["title"]
  end

protected

  def w_api
    w_api ||= Wunderground.new(ENV["WUG_CREDS"])
  end

  def future_weather
    future_weather ||= w_api.planner_for(Time.now,Time.now+7.days, @zip_code)
    #binding.pry
  end
end
