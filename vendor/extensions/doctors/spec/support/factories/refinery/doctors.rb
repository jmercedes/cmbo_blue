
FactoryGirl.define do
  factory :doctor, :class => Refinery::Doctors::Doctor do
    sequence(:prefix) { |n| "refinery#{n}" }
  end
end

