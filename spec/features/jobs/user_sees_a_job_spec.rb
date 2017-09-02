require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    job = create(:job)
    company = Company.find(job.company_id)

    visit company_job_path(company, job)

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.description)
    expect(page).to have_content(job.level_of_interest)
  end
end
