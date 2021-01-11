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
require "rails_helper"

RSpec.describe Post, type: :model do
  context "必要な情報が揃っている時" do
    let(:post) { create(:post, user_id: user_id) }
    let!(:user) { create(:user) }
    let!(:user_id) { user.id }
    it "投稿ができる" do
      expect(post).to be_valid
    end
  end

  context "title が入力されていない時" do
    let(:post) { build(:post, user_id: user_id, title: nil) }
    let!(:user) { create(:user) }
    let!(:user_id) { user.id }
    it "エラーになる" do
      expect(post).to be_invalid
    end
  end
end
