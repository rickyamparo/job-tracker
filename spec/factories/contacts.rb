FactoryGirl.define do
  factory :contact do

    sequence :name do |n|
      "John Snow #{n}"
    end

    sequence :email do |n|
      "Crow4Lyfe#{n}@gmail.com"
    end

    sequence :position do |n|
      "Squad Leader #{n}"
    end

    company
  end
end
