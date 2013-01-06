
FactoryGirl.define do
  factory :branch, :class => Refinery::Doctors::Branch do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

