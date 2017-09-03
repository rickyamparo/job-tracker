require 'rails_helper'

describe "User creates new comment for job" do
  scenario "a user uses the comment form to create a new comment" do
    job = create(:job)
    company = Company.find(job.company_id)

    visit company_job_path(company, job)

    fill_in "comment[content]", with: "Turtles can comment too"
    click_button "Create"

    expect(current_path).to eq "/companies/#{company.id}/jobs/#{job.id}"
    expect(page).to have_content "Turtles can comment too"
  end
end
