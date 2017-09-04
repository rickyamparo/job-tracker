class DashboardController < ApplicationController

  def index
    @jobs_by_interest = Job.group(:level_of_interest).count
    @jobs = Job.all
  end

end
