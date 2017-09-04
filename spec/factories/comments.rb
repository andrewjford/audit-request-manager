FactoryGirl.define do
  factory :comment do
    content "I am the walrus"
    association :user
    association :request
    association :project
  end
end
