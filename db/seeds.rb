# サンプルユーザーを作成
user = User.create!(email: 'user@example.com')

# サンプルの難易度
difficulty_easy = Difficulty.create!(name: '初級')
difficulty_medium = Difficulty.create!(name: '中級')
difficulty_advanced = Difficulty.create!(name: '上級')

# サンプルのベース
base_rum = BaseLiquor.create!(name: 'ラム')
base_gin = BaseLiquor.create!(name: 'ジン')
base_tequila = BaseLiquor.create!(name: 'テキーラ')
base_vodka = BaseLiquor.create!(name: 'ウォッカ')

# サンプルの材料
ingredient_mint = Ingredient.create!(name: 'ミント')
ingredient_lime = Ingredient.create!(name: 'ライム')
ingredient_sugar = Ingredient.create!(name: '砂糖')
ingredient_soda = Ingredient.create!(name: '炭酸水')

# サンプルフレーバー
sweet = Flavor.create!(name: '甘味系')
sour = Flavor.create!(name: '酸味系')
bitter = Flavor.create!(name: '苦味系')
spicy = Flavor.create!(name: '辛味系')
fruity = Flavor.create!(name: 'フルーティ系')
rich = Flavor.create!(name: '濃厚・コク系')
refreshing = Flavor.create!(name: 'さっぱり系')
smoky = Flavor.create!(name: 'スモーキー系')

# サンプルカクテル 1: Mojito
mojito = Recipe.create!(
  name: 'Mojito',
  alcohol_strength: 'strong',  # 適切な値を追加
  difficulty: difficulty_easy,
  base_liquor: base_rum,
  flavor: sour,
  user: user  # ユーザーを関連付け
)

# レシピの材料を関連付ける
mojito.ingredients << [ingredient_mint, ingredient_lime, ingredient_sugar, ingredient_soda]
mojito.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# サンプルカクテル 2: Martini
martini = Recipe.create!(
  name: 'Martini',
  alcohol_strength: 'medium',  # 適切な値を追加
  difficulty: difficulty_medium,
  base_liquor: base_gin,
  flavor: bitter,
  user: user  # ユーザーを関連付け
)
martini.ingredients << ingredient_lime
martini.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
