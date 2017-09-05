class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sorting_jobs(params, company_id)
    where(company_id: company_id).order(params)
  end

  def self.jobs_by_interest
    group(:level_of_interest).count
  end

  def self.top_3_companies
    
  end

end
