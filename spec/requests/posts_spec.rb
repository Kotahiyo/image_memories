require "rails_helper"

RSpec.describe "Api::V1::Posts", type: :request do
  describe "GET api/v1/posts" do
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

  describe "GET api/v1/posts/:id" do
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

  describe "POST api/v1/posts" do
    subject { post(api_v1_posts_path, params: params) }
    context "適切な値が渡ったとき" do
      let(:params) do
        { post: attributes_for(:post) }
      end
      let!(:current_user) { create(:user) }

      it "記事が作成できる" do
        expect { subject }.to change { Post.count }.by(1)
        res = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(res["title"]).to eq params[:post][:title]
        expect(res["user"]["id"]).to eq current_user.id
      end
    end
  end

  describe "PATCH api/v1/posts/:id" do
    subject { patch(api_v1_post_path(post.id), params: params) }

    let(:params) do
      { post: attributes_for(:post, created_at: 1.days.ago) }
    end
    let(:current_user) { create(:user) }
    before { allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user).and_return(current_user) }

    context "自分が所持している記事を編集したとき" do
      let(:post) { create(:post, user: current_user) }
      it "記事が更新される" do
        expect { subject }.to change { post.reload.title }.from(post.title).to(params[:post][:title])
        expect { subject }.not_to change { post.reload.created_at }
        expect(response).to have_http_status(:ok)
      end
    end

    context "他人が所持している記事を編集したとき" do
      let!(:post) { create(:post, user: other_user) }
      let(:other_user) { create(:user) }
      it "更新できない" do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound) &
                                          change { Post.count }.by(0)
      end
    end
  end

  describe "DELETE /api/v1/posts/:id" do
    subject { delete(api_v1_post_path(post_id)) }
    let(:post_id) { post.id }
    let(:current_user) { create(:user) }
    before { allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user).and_return(current_user) }

    context "自分が所持している記事を削除したとき" do
      let!(:post) { create(:post, user: current_user) }
      it "記事が削除される" do
        expect { subject }.to change { Post.count }.by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end

    context "他人が所持している記事を削除しようとしたとき" do
      let!(:post) { create(:post, user: other_user) }
      let(:other_user) { create(:user) }
      it "削除できない" do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound) &
                                          change { Post.count }.by(0)
      end
    end
  end
end
