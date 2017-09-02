require 'rails_helper'

describe "User sees all comments on job page" do
  scenario "a user sees all the comments made for a job" do
    comment = create(:comment)
    job = Job.find(comment.job_id)
    company = Company.find(job.company_id)

    visit company_job_path(company, job)

    expect(page).to have_content(comment.content)
  end

  scenario "a user sees all comments descneding in proper order" do
    job = create(:job)
    company = Company.find(job.company_id)
    comment1 = job.comments.create(content: "This is a comment 1")
    comment2 = job.comments.create(content: "This is a comment 2")

    visit company_job_path(company, job)

    expect(comment2.content).to appear_before(comment1.content)
  end
end
