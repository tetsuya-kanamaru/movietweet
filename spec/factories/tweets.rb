FactoryBot.define do
  factory :tweet do
    Faker::Config.locale = :ja

    title {Faker::Lorem.word}
    content {Faker::Lorem.sentence}

    attachment {fixture_file_upload("test_image.jpg")}

    association :user
  end
end