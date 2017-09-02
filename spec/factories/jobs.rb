FactoryGirl.define do
  factory :job do
    sequence :title do |n|
      "Jobby#{n}"
    end

    sequence :level_of_interest do |n|
      n
    end

    sequence :city do |n|
      "Townsville#{n}"
    end

    company
    category
  end
end
