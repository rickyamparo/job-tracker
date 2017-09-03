class Contact < ApplicationRecord
  validates :name, :email, :position, presence: true
  belongs_to :company
end
