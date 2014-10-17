class CurrentCondition

  def initialize(zip_code = "34102")
    @zip_code ||= zip_code
  end

  def city_state
    current_weather["display_location"]["full"]
  end

  def last_updated
    current_weather["observation_time"]
  end

  def local_time
    current_weather["local_time_rfc822"]
  end

  def overview_name
    current_weather["weather"]
  end

  def icon
    current_weather["icon_url"]
  end

  def temp_f
    current_weather["temp_f"]
  end

  def temp_c
    current_weather["temp_c"]
  end

  def relative_humidity
    current_weather["relative_humidity"]
  end

  def wind_intensity
    current_weather["wind_string"]
  end

  def wind_direction
    current_weather["wind_dir"]
  end

  def wind_speed
    current_weather["wind_mph"]
  end

  def wind_gust_speed
    current_weather["wind_gust_mph"]
  end

  def barometric_pressure
    current_weather["pressure_in"]
  end

  def dewpoint
    current_weather["dewpoint_f"]
  end

  def feels_like
    current_weather["feelslike_f"]
  end

  def visibility
    current_weather["visibility_m"]
  end

  def uv_index
    current_weather["UV"]
  end

  def precip_today
    current_weather["precip_today_in"]
  end

  def hour_precip
    current_weather["precip_1hr_in"]
  end


  protected
  def w_api
    w_api ||= Wunderground.new(ENV["WUG_CREDS"])
  end

  def current_weather
    current_weather ||= w_api.conditions_for(@zip_code)["current_observation"]
  end
end
