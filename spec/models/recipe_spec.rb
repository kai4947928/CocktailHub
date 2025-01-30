require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'バリデーション' do
    it '名前があれば有効' do
      recipe = build(:recipe, name: 'カクテルX')
      expect(recipe).to be_valid
    end

    it '名前がなければ無効' do
      recipe = build(:recipe, name: nil)
      expect(recipe).to be_invalid
    end
  end
end
