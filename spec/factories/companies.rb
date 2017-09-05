FactoryGirl.define do
  factory :company do
    sequence :name do |n|
      "Business & Co #{n}"
    end
  end
end
