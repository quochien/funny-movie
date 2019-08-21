FactoryBot.define do
  factory :movie do
    title "Movie Title"
    description "Movie Description"
    youtube_url Faker::Internet.url
    user
  end
end
