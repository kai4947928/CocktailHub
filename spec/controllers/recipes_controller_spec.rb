require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  let!(:official_recipe) do
    recipe = FactoryBot.build(:recipe, :with_category, category_list: ["公式"])
    recipe.save!  # バリデーションエラーがあればここで発生します
    recipe
  end

  let!(:post_recipe) do
    recipe = FactoryBot.build(:recipe, :with_category, category_list: ["投稿"])
    recipe.save!  # バリデーションエラーがあればここで発生します
    recipe
  end

  # indexアクションのテスト
  describe 'GET #index' do
    it 'assigns @official_recipes' do
      get :index, params: { q: { name_cont: 'recipe' } }
      expect(assigns(:official_recipes)).to be_present
    end

    it 'assigns @post_recipes' do
      get :index, params: { q: { name_cont: 'recipe' } }
      expect(assigns(:post_recipes)).to be_present
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  # autocompleteアクションのテスト
  describe 'GET #autocomplete' do
    it 'returns matching recipes as JSON' do
      recipe = FactoryBot.create(:recipe, name: 'Mojito')
      get :autocomplete, params: { q: 'Mojito' }, format: :json
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to include({'id' => recipe.id, 'name' => recipe.name})
    end

    it 'renders autocomplete template for HTML' do
      get :autocomplete, params: { q: 'Mojito' }, format: :html
      expect(response).to render_template('autocomplete')
    end
  end

  # showアクションのテスト
  describe 'GET #show' do
    it 'assigns @recipe and @user' do
      recipe = FactoryBot.create(:recipe)
      get :show, params: { id: recipe.id }
      expect(assigns(:recipe)).to eq(recipe)
      expect(assigns(:user)).to eq(recipe.user)
    end

    it 'sets the meta tags' do
      recipe = FactoryBot.create(:recipe)
      get :show, params: { id: recipe.id }
      expect(response.body).to include(recipe.name)
    end
  end

  # createアクションのテスト
  describe 'POST #create' do
    it 'creates a new recipe and redirects to show page' do
      recipe_params = { name: 'New Cocktail', alcohol_strength: 5, user_id: user.id }
      expect {
        post :create, params: { recipe: recipe_params }
      }.to change(Recipe, :count).by(1)
      expect(response).to redirect_to(assigns(:recipe))
      expect(flash[:notice]).to eq('カクテルが投稿できました！')
    end

    it 'renders the new template on failure' do
      recipe_params = { name: '' }  # Invalid parameters
      post :create, params: { recipe: recipe_params }
      expect(response).to render_template('new')
      expect(flash.now[:alert]).to eq('カクテルの投稿に失敗しました。')
    end
  end

  # updateアクションのテスト
  describe 'PATCH #update' do
    it 'updates the recipe and redirects to show page' do
      recipe = FactoryBot.create(:recipe, user: user)
      patch :update, params: { id: recipe.id, recipe: { name: 'Updated Name' } }
      recipe.reload
      expect(recipe.name).to eq('Updated Name')
      expect(response).to redirect_to(recipe)
      expect(flash[:notice]).to eq('カクテルが更新されました！')
    end

    it 'renders the edit template on failure' do
      recipe = FactoryBot.create(:recipe, user: user)
      patch :update, params: { id: recipe.id, recipe: { name: '' } }
      expect(response).to render_template('edit')
      expect(flash.now[:alert]).to eq('カクテルの更新に失敗しました。')
    end
  end

  # destroyアクションのテスト
  describe 'DELETE #destroy' do
    it 'deletes the recipe and redirects to my_recipes' do
      recipe = FactoryBot.create(:recipe, user: user)
      expect {
        delete :destroy, params: { id: recipe.id }
      }.to change(Recipe, :count).by(-1)
      expect(response).to redirect_to(my_recipes_recipes_path)
      expect(flash[:notice]).to eq('カクテルが削除されました')
    end
  end
end