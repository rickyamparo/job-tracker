require 'rails_helper'

describe "User sees all comments on job page" do
  scenario "a user sees all the comments made for a job" do
    comment = create(:comment)
    job = Job.find(comment.job_id)
    company = Company.find(job.company_id)

    visit company_job_path(company, job)

    expect(page).to have_content(comment.content)
  end
end
