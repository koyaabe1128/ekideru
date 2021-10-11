FactoryBot.define do
  factory :user do
    name {"sample"}
    email {"sample@sample.com"}
    password {"User1234"}
    password_confirmation {"User1234"}
  end
end