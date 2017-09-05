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

     job1 = create(:job, level_of_interest: 10, company_id: company1.id)
     job2 = create(:job, level_of_interest: 20, company_id: company2.id)
     job3 = create(:job, level_of_interest: 35, company_id: company3.id)
     job4 = create(:job, level_of_interest: 40, company_id: company4.id)
     job5 = create(:job, level_of_interest: 50, company_id: company1.id)

     visit "/dashboard"

     expect(page).to have_content(company4.name)
     expect(page).to have_content(company3.name)
     expect(page).to have_content(company1.name)
  end
end
