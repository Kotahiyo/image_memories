# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number: 10) }
    user

    after(:build) do |built_post|
      built_post.memories << FactoryBot.build(:memory, post: built_post)
    end
  end

  factory :memory do
    image { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/test.jpg"), "spec/fixtures/test.jpg") }
  end
end
