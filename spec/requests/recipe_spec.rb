#カクテル投稿
require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "POST /recipes" do
    context "ログインしている場合" do
      before do
        # OmniAuthをモックしてユーザーをログイン状態にする
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
          provider: "google_oauth2",
          uid: "123456789",
          info: { email: "test@example.com", name: "Test User" },
          credentials: { token: "mock_token" }
        )

        # ログインユーザーを作成
        user = User.create(email: "test@example.com", provider: "google_oauth2", uid: "123456789")
        sign_in user # Deviseでログイン
      end

      it "カクテルを投稿できる" do
        expect {
          post recipes_path, params: {
            recipe: {
              name: "モヒート",
              procedure: "ラムとミントの爽やかカクテル",
              difficulty_id: Difficulty.first.id,
              flavor_id: Flavor.first.id,
              base_liquor_id: BaseLiquor.first.id
            }
          }
        }.to change(Recipe, :count).by(1) # 1件増えることを確認

        recipe = Recipe.last

        # 投稿後のリダイレクト先がroot_pathか確認
        expect(response).to redirect_to(recipe_path(recipe))
      end
    end
  end
end