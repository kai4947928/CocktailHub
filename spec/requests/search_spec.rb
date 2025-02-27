#検索
require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "GET /recipes" do
    context "難易度、ベース、およびフリーワードを組み合わせて検索した場合" do
      it "該当するカクテルが表示される" do
        # 必要なデータを作成（ユーザーは不要）
        difficulty = create(:difficulty, name: "簡単")
        base_liquor = create(:base_liquor, name: "ラム")

        # カクテルレシピの作成
        recipe = create(:recipe, name: "モヒート", difficulty: difficulty, base_liquor: base_liquor)

        # 検索クエリを送信
        get recipes_path, params: {
          difficulty_id: difficulty.id,
          base_liquor_id: base_liquor.id,
        }

        # レスポンスに該当するカクテルが含まれていることを確認
        expect(response.body).to include(recipe.name)
      end
    end
  end
end
