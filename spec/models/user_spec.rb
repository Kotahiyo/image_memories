# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "rails_helper"

RSpec.describe User, type: :model do
  context "必要な情報が揃っている時" do
    let(:user) { build(:user) }

    it "ユーザー登録できる" do
      expect(user).to be_valid
    end
  end

  # context "name が入力されていないと" do
  #   let(:user) { build(:user, name: nil) }

  #   it "エラーになる" do
  #     expect(user).to be_invalid
  #   end
  # end

  context "email が入力されていないと" do
    let(:user) { build(:user, email: nil) }

    it "エラーになる" do
      expect(user).to be_invalid
    end
  end

  context "password が入力されていないと" do
    let(:user) { build(:user, password: nil) }

    it "エラーになる" do
      expect(user).to be_invalid
    end
  end
end
