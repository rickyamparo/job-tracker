require 'rails_helper'

describe "User Can see all Dashboard Info Correctly" do
  scenario "a user visits the dashboard to view job count by level of interest" do
    job1 = create(:job, level_of_interest: 20)
    job2 = create(:job, level_of_interest: 20)
    job3 = create(:job, level_of_interest: 20)
    job4 = create(:job, level_of_interest: 10)

    visit "/dashboard"

    
  end
end
