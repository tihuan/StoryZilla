FactoryGirl.define do
  factory :user do
    username "example_user"
    email "user@example.com"
    password "password"
    password_confirmation "password"
  end
end
