FactoryGirl.define do
  factory :user do
    username "example_user"
    email "user@example.com"
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
