FactoryGirl.define do
  factory :project do
    sequence(:title) {|n| "Test Project #{n}"}
  end
end
