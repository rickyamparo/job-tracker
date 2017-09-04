require 'rails_helper'

describe "User Can see all Dashboard Info Correctly" do
  scenario "a user visits the dashboard to view job count by level of interest" do
    job1 = create(:job, level_of_interest: 20)
    job2 = create(:job, level_of_interest: 30, company: job1.company)
    job3 = create(:job, level_of_interest: 20, company: job1.company)
    job4 = create(:job, level_of_interest: 10, company: job1.company)

    visit "/dashboard"

    expect(page).to have_content(3)
    expect(page).to have_content(1)
  end
end
