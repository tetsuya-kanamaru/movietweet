FactoryBot.define do
  factory :comment do
    Faker::Config.locale = :ja

    comment {Faker::Lorem.sentence}

    association :tweet
    association :user
  end
end 