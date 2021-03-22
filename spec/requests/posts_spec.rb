require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do
  describe "GET /posts" do
    subject { get(api_v1_posts_path) }
    let!(:post_1) { create(:post, updated_at: 1.days.ago) }
    let!(:post_2) { create(:post, updated_at: 2.days.ago) }
    let!(:post_3) { create(:post) }
    it "記事一覧が取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(res.length).to eq 3
      expect(res[0].keys).to eq ["id", "title", "updated_at", "user"]
    end
  end

  describe "GET /posts/:id" do
    subject { get(api_v1_post_path(post_id)) }
    let!(:post) { create(:post) }
    let(:post_id) { post.id }
    fit "記事詳細が取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(res["title"]).to eq post.title
      expect(res["user"]["id"]).to eq post.user.id
    end
  end
end
