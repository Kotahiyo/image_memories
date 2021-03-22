require "rails_helper"

RSpec.describe "Api::V1::Posts", type: :request do
  describe "GET /posts" do
    subject { get(api_v1_posts_path) }
    let!(:post1) { create(:post, updated_at: 1.days.ago) }
    let!(:post2) { create(:post, updated_at: 2.days.ago) }
    let!(:post3) { create(:post) }
    it "記事一覧が取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(res.length).to eq 3
      expect(res[0].keys).to eq ["id", "title", "updated_at", "user"]
    end
  end

  describe "GET /posts/:id" do
    subject { get(api_v1_post_path(post_id)) }
    let!(:post) { create(:post) }
    let(:post_id) { post.id }
    it "記事詳細が取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
      expect(res["title"]).to eq post.title
      expect(res["user"]["id"]).to eq post.user.id
    end
  end

  describe "POST /posts" do
    subject { post(api_v1_posts_path, params: params) }
    context "適切な値が渡ったとき" do
    let(:params) do
      { post: attributes_for(:post) }
    end
    fit "記事が作成できる" do
      subject
      binding.pry
      res = JSON.parse(response.body)
      expect(response).to have_http_status(:ok)
    end
    end
  end
end
