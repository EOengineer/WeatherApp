class CurrentCondition
  attr_reader :zip_code

  def initialize(zip_code)
    @zip_code = zip_code.present? ? zip_code : "34102"
  end

  def gather_all
    { city_state: current_weather["display_location"]["full"],
      last_updated: current_weather["observation_time"],
      local_time: current_weather["local_time_rfc822"],
      overview_name: current_weather["weather"],
      icon: current_weather["icon_url"],
      temp_f: current_weather["temp_f"],
      temp_c: current_weather["temp_c"],
      relative_humidity: current_weather["relative_humidity"],
      wind_intensity: current_weather["wind_string"],
      wind_direction: current_weather["wind_dir"],
      wind_speed: current_weather["wind_mph"],
      wind_gust_speed: current_weather["wind_gust_mph"],
      barometric_pressure: current_weather["pressure_in"],
      dewpoint: current_weather["dewpoint_f"],
      feels_like: current_weather["feelslike_f"],
      visibility: current_weather["visibility_m"],
      uv_index: current_weather["UV"],
      precip_today: current_weather["precip_today_in"],
      hour_precip: current_weather["precip_1hr_in"]
    }
  end


  private
  def w_api
    w_api ||= Wunderground.new(ENV["WUG_CREDS"])
  end

  def current_weather
    current_weather ||= w_api.conditions_for(@zip_code)["current_observation"]
  end

end
