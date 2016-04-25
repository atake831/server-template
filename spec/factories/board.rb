FactoryGirl.define do
  factory :board do
    title FFaker::Lorem.sentence
    text FFaker::Lorem.sentence
  end
end
