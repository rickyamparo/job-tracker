FactoryGirl.define do
  factory :company do
    sequence :name do |n|
      "Business & Co #{1}"
    end
  end
end
