#検索
require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  describe "GET /recipes" do
    context "難易度、ベース、およびフリーワードを組み合わせて検索した場合" do
      it "該当するカクテルが表示される" do

        difficulty = create(:difficulty, name: "簡単")
        base_liquor = create(:base_liquor, name: "ラム")

        recipe = create(:recipe, name: "モヒート", difficulty: difficulty, base_liquor: base_liquor)

        get recipes_path, params: {
          difficulty_id: difficulty.id,
          base_liquor_id: base_liquor.id,
        }

        expect(response.body).to include(recipe.name)
      end
    end
  end
end
