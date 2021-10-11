FactoryBot.define do
  factory :favorite do
    association :place
    association :user
  end
end