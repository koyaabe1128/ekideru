FactoryBot.define do
  factory :connection do
    association :place
    association :exit
  end
end