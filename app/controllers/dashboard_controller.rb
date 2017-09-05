class DashboardController < ApplicationController

  def index
    @jobs_by_interest = Job.jobs_by_interest
    @top_3_companies = Job.top_3_companies
    @jobs_by_city = Job.jobs_by_city
    @jobs = Job.all
  end

end
