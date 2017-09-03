FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "examplenumber#{n}@a.a"}
    name "Abe"
    password "hahahahaha"
    organization Organization.new(name: "testCorp")
  end
end
