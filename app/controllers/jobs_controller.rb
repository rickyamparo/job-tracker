class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    if params[:sort]
      @jobs = Job.sorting_jobs(params[:sort], @company.id)
    else
      @jobs = @company.jobs
    end
  end

  def location
    @jobs = Job.city_jobs(params[:city])
    @city = params[:city]
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}, under the #{@job.category} category"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comments = @job.comments
    @comments = @comments.order(created_at: :desc)
    @comment = Comment.new()
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    company = Company.find(params[:company_id])
    job = Job.find(params[:id])
    job.destroy

    flash[:success] = "#{job.title} was successfully deleted!"
    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
