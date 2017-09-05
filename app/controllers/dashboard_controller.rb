class DashboardController < ApplicationController

  def index
    @jobs_by_interest = Job.jobs_by_interest
    @top_3_companies = Job.top_3_companies
    @jobs = Job.all
  end

end
