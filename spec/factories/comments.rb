FactoryGirl.define do
  factory :comment do

    sequence :content do |n|
      "This is a comment about turtles#{n}"
    end

    job
  end
end
