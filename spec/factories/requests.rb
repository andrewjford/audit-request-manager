FactoryGirl.define do
  factory :request do
    title "Give us the money Lebowski"
    description "Where's the money Lebowski"
    request_number 1
    association :project
    association :user
  end
end
