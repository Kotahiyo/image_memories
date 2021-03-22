require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do
  describe "GET /posts" do
    subject { get(api_v1_posts_path) }
    let!(:post_1) { create(:post, updated_at: 1.days.ago) }
    let!(:post_2) { create(:post, updated_at: 2.days.ago) }
    let!(:post_3) { create(:post) }
    fit "記事一覧が取得できる" do
      subject
      binding.pry
      response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end
end
