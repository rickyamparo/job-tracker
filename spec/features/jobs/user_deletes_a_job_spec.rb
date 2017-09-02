require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    job = create(:job)
    company = Company.find(job.company_id)

    visit company_jobs_path(company, job)

    click_link "Delete"

    expect(page).to have_content(job.title + " was successfully deleted")
  end
end
