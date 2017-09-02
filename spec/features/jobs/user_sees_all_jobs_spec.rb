require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    job = create(:job)
    company = Company.find(job.company_id)

    visit company_path(company)

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.description)
  end
end
