require 'rails_helper'

feature "get current weather conditions", %q{
  As an unauthenticated visitor
  I want to enter my zip code
  so that I can see my local weather
  } do

    #Acceptance Criteria:
    #I should see a zip code field
    #Entering my zip code should return current weather for that area

  scenario 'visitor views homepage' do
    visit current_conditions_path
    expect(current_path).to eq(current_conditions_path)
  end

  scenario 'visitor specifies valid location' do
    visit current_conditions_path
    fill_in 'Zip code', with: '02135'
    click_button 'Submit'
    expect(current_path).to eq(current_conditions_path)
    expect(page).to have_content("Current Conditions in Brighton, MA")
  end
end


