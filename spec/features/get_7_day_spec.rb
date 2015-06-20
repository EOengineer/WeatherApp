require 'rails_helper'

feature "get 7 day weather conditions", %q{
  As an unauthenticated visitor
  I want to see my 7 day weather forecast
  } do

    #Acceptance Criteria:
    #It should infer my location from current conditions page
    #It should show a 7 day forecast for my location


  scenario 'visitor specifies valid location' do
    visit future_conditions_url
    expect(current_path).to eq(future_conditions_path)
    expect(page).to have_content("7 day Conditions in Brighton, MA")
  end
end
