require 'rails_helper'

describe "User Can see all Dashboard Info Correctly" do
  scenario "a user visits the dashboard to view job count by level of interest" do
    job1 = create(:job, level_of_interest: 20)
    job2 = create(:job, level_of_interest: 30, company: job1.company)
    job3 = create(:job, level_of_interest: 20, company: job1.company)
    job4 = create(:job, level_of_interest: 10, company: job1.company)

    visit "/dashboard"

    expect(page).to have_content("The interest level of 30 has 1 job(s).")
    expect(page).to have_content("The interest level of 20 has 2 job(s).")
    expect(page).to have_content("The interest level of 10 has 1 job(s).")
  end

  scenario "a user visits the dashboard to view top 3 companies by average level of interest" do
     company1 = create(:company)
     company2 = create(:company)
     company3 = create(:company)
     company4 = create(:company)

     job1 = create(:job, level_of_interest: 10, company: company1)
     job2 = create(:job, level_of_interest: 20, company: company2)
     job3 = create(:job, level_of_interest: 35, company: company3)
     job4 = create(:job, level_of_interest: 40, company: company4)
     job5 = create(:job, level_of_interest: 50, company: company1)

     visit "/dashboard"

     expect(company4.name).to appear_before(company3.name)
     expect(company3.name).to appear_before(company1.name)
  end
end
