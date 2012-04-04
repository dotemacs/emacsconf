
FactoryGirl.define do
  factory :user do
    name 'Bill'
    email 'user@user.com'
    password 'qwerty'
    password_confirmation 'qwerty'
  end
end
