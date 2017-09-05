class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sorting_jobs(params, company_id)
    where(company_id: company_id).order(params)
  end

  def self.city_jobs(params)
    where(city: params)
  end

  def self.jobs_by_interest
    order(:level_of_interest).group(:level_of_interest).count
  end

  def self.top_3_companies
    group(:company_id).average('level_of_interest').invert.max(3)
  end

  def self.jobs_by_city
    order(:city).group(:city).order(:city).count
  end

end
