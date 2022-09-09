FactoryBot.define do
  factory :link do
    url { Faker::Internet.url }
    encoded_string { '' }
  end    

end
