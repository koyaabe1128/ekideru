FactoryBot.define do
  factory :user do
    name {"sample"}
    email {"sample@sample.com"}
    password {"123456"}
    password_confirmation {"123456"}
  end
end