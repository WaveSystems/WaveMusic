require 'factory_girl'

FactoryGirl.define do
  factory :user do
    username 'sampleuser'
    email 'user@example.com'
    password 'supersecret'
    password_confirmation 'supersecret'
    authentication_token 'an authentication_token'
  end
end
