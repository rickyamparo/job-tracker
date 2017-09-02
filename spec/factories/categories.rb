FactoryGirl.define do
  factory :category do
    sequence :title do |n|
      "Turtle #{n}"
    end
  end
end
