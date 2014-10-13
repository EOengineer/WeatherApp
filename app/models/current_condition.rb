class CurrentCondition

  def initialize(zip_code = 34102)
    @zip_code = zip_code
  end

  protected
  def w_api
    @w_api ||= Wunderground.new(ENV["WUG_CREDS"])
  end

  def current_weather
    @current_weather ||= w_api.conditions_for(@zip_code)
  end
end
