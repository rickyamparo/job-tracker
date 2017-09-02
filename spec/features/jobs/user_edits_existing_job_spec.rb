require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    job = create(:job)
    company = Company.find(job.company_id)
    
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Sports God"
    click_button "Update"

    expect(current_path).to eq("/companies/#{job.id}/jobs/#{job.id}")
    expect(page).to_not have_content("Sports Person")
    expect(page).to have_content("Sports God")
  end
end
