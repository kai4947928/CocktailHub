require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe "バリデーションのテスト" do
    it "名前があれば有効であること" do
      recipe = FactoryBot.build(:recipe, name: "モヒート")
      expect(recipe).to be_valid
    end

    it "名前がなければ無効であること" do
      recipe = FactoryBot.build(:recipe, name: nil)
      expect(recipe).to_not be_valid
    end
  end

  describe "アソシエーションのテスト" do
    it { should belong_to(:user) }
    it { should belong_to(:difficulty) }
    it { should belong_to(:base_liquor) }
    it { should belong_to(:flavor) }

    it { should have_many(:recipe_ingredients).dependent(:destroy) }
    it { should have_many(:ingredients).through(:recipe_ingredients) }

    it { should have_many(:favorites).dependent(:destroy) }
    it { should have_many(:favorited_by_users).through(:favorites) }

    it { should have_one_attached(:image) }
  end

  describe "コールバックのテスト" do
    it "デフォルトでカテゴリタグを追加する" do
      recipe = FactoryBot.build(:recipe, category_list: [])
      recipe.save
      expect(recipe.category_list).to include("投稿")
    end

    it "既に'公式'タグがあれば'投稿'は追加されない" do
      recipe = FactoryBot.build(:recipe, category_list: ["公式"])
      recipe.save
      expect(recipe.category_list).to_not include("投稿")
    end
  end

  describe "enumのテスト" do
    it "alcohol_strengthに正しい値が設定できる" do
      recipe = FactoryBot.build(:recipe, alcohol_strength: :medium)
      expect(recipe.alcohol_strength).to eq("medium")
    end
  end

  describe "インスタンスメソッドのテスト" do
    it "quantity_blank?が正しく動作する" do
      recipe = Recipe.new
      expect(recipe.quantity_blank?({ 'quantity' => '' })).to be_truthy
      expect(recipe.quantity_blank?({ 'quantity' => '30ml' })).to be_falsey
    end
  end

  describe "ransackの設定テスト" do
    it "ransackable_attributesが正しい属性を返す" do
      expect(Recipe.ransackable_attributes).to match_array(["name", "base_liquor_id", "difficulty_id"])
    end

    it "ransackable_associationsが正しい関連を返す" do
      expect(Recipe.ransackable_associations).to match_array(["base_liquor", "difficulty", "flavor", "ingredients", "parent_recipe", "recipe_ingredients", "user"])
    end
  end
end