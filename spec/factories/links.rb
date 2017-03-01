FactoryGirl.define do
  factory :link do
    title Faker::Internet.domain_suffix
    url Faker::Internet.url
    read 'false'
    user
  end
end
