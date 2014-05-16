FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "user-#{n}" }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :story do
    title "My Story"
    beginning "Once upon a time"
    completion_status false
    user
  end
end
