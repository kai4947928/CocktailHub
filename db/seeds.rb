# frozen_string_literal: true

# サンプルユーザーを作成
user = User.create!(email: 'user@example.com', password: 'password123',
                    password_confirmation: 'password123')

# サンプルの難易度
difficulty_easy = Difficulty.create!(name: '初級')
difficulty_medium = Difficulty.create!(name: '中級')
difficulty_advanced = Difficulty.create!(name: '上級')

# サンプルのベース
base_rum = BaseLiquor.create!(name: 'ラム')
base_gin = BaseLiquor.create!(name: 'ジン')
base_tequila = BaseLiquor.create!(name: 'テキーラ')
base_vodka = BaseLiquor.create!(name: 'ウォッカ')
base_whiskey = BaseLiquor.create!(name: 'ウイスキー')
base_irish_whiskey = BaseLiquor.create!(name: 'アイリッシュウイスキー')
base_scotch = BaseLiquor.create!(name: 'スコッチウイスキー')

# 必要な材料
ingredient_tonic_water = Ingredient.create!(name: 'トニックウォーター')
ingredient_lemon_juice = Ingredient.create!(name: 'レモンジュース')
ingredient_sugar = Ingredient.create!(name: '砂糖')
ingredient_soda = Ingredient.create!(name: '炭酸水')
ingredient_ginger_ale = Ingredient.create!(name: 'ジンジャーエール')
ingredient_lime = Ingredient.create!(name: 'ライム')
ingredient_vermouth = Ingredient.create!(name: 'ヴェルモット')
Ingredient.create!(name: 'シャンパン')
ingredient_egg_white = Ingredient.create!(name: '卵白')
ingredient_grenadine = Ingredient.create!(name: 'グレナデン')
ingredient_orange_juice = Ingredient.create!(name: 'オレンジジュース')
ingredient_campari = Ingredient.create!(name: 'カンパリ')
ingredient_curacao = Ingredient.create!(name: 'キュラソー')
ingredient_lime_juice = Ingredient.create!(name: 'ライムジュース')
ingredient_triple_sec = Ingredient.create!(name: 'トリプルセック')
ingredient_salt = Ingredient.create!(name: '塩')
ingredient_tomato_juice = Ingredient.create!(name: 'トマトジュース')
ingredient_cranberry_juice = Ingredient.create!(name: 'クランベリージュース')
ingredient_grapefruit_juice = Ingredient.create!(name: 'グレープフルーツジュース')
Ingredient.create!(name: 'カシスリキュール')
ingredient_blue_curacao = Ingredient.create!(name: 'ブルーキュラソー')
ingredient_pineapple_juice = Ingredient.create!(name: 'パイナップルジュース')
ingredient_tabasco = Ingredient.create!(name: 'タバスコ')
ingredient_ginger_beer = Ingredient.create!(name: 'ジンジャビール')
ingredient_beef_broth = Ingredient.create!(name: 'ビーフブロス')
ingredient_peach_liqueur = Ingredient.create!(name: 'ピーチリキュール')
ingredient_coke = Ingredient.create!(name: 'コーラ')
ingredient_coffee_liqueur = Ingredient.create!(name: 'コーヒーリキュール')
ingredient_rum = Ingredient.create!(name: 'ラム')
ingredient_gin = Ingredient.create!(name: 'ジン')
ingredient_mint = Ingredient.create!(name: 'ミント')
ingredient_coconut_milk = Ingredient.create!(name: 'ココナッツミルク')
ingredient_maraschino = Ingredient.create!(name: 'マラスキーノ')
ingredient_champagne = Ingredient.create!(name: 'シャンパン')
ingredient_cream = Ingredient.create!(name: 'クリーム')
ingredient_orgeat_syrup = Ingredient.create!(name: 'オルジェ・シロップ')
ingredient_sweet_and_sour = Ingredient.create!(name: 'スウィート＆サワー')
ingredient_bitters = Ingredient.create!(name: 'ビターズ')
ingredient_drambuie = Ingredient.create!(name: 'ドランブイ')
ingredient_amaretto = Ingredient.create!(name: 'アマレット')
ingredient_coffee = Ingredient.create!(name: 'コーヒー')
ingredient_water = Ingredient.create!(name: '水')

# サンプルフレーバー
sweet = Flavor.create!(name: '甘味系')
sour = Flavor.create!(name: '酸味系')
bitter = Flavor.create!(name: '苦味系')
spicy = Flavor.create!(name: '辛味系')
Flavor.create!(name: 'フルーティ系')
Flavor.create!(name: '濃厚・コク系')
refreshing = Flavor.create!(name: 'さっぱり系')
Flavor.create!(name: 'スモーキー系')

# サンプルカクテル 1: ジントニック
gin_tonic = Recipe.create!(
  name: 'ジントニック',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_gin,
  flavor: bitter,
  category_list: "公式",
  user: user
)
gin_tonic.ingredients << [ingredient_tonic_water]
gin_tonic.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: ビルド

# サンプルカクテル 2: ジンフィズ
gin_fizz = Recipe.create!(
  name: 'ジンフィズ',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_gin,
  flavor: sour,
  category_list: "公式",
  user: user
)
gin_fizz.ingredients << [ingredient_lemon_juice, ingredient_sugar, ingredient_soda]
gin_fizz.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク、ビルド

# サンプルカクテル 3: ジンバック
gin_buck = Recipe.create!(
  name: 'ジンバック',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_gin,
  flavor: spicy,
  category_list: "公式",
  user: user
)
gin_buck.ingredients << [ingredient_ginger_ale, ingredient_lime]
gin_buck.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: ビルド

# サンプルカクテル 4: ジンリッキー
gin_rickey = Recipe.create!(
  name: 'ジンリッキー',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_gin,
  flavor: sour,
  category_list: '公式',
  user: user
)
gin_rickey.ingredients << [ingredient_lime, ingredient_soda]
gin_rickey.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: ビルド

# サンプルカクテル 5: ジンライム
gin_lime = Recipe.create!(
  name: 'ジンライム',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_gin,
  flavor: sour,
  category_list: '公式',
  user: user
)
gin_lime.ingredients << [ingredient_lime]
gin_lime.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# サンプルカクテル 6: マティーニ
martini = Recipe.create!(
  name: 'マティーニ',
  alcohol_strength: 'strong',
  difficulty: difficulty_easy,
  base_liquor: base_gin,
  flavor: bitter,
  category_list: '公式',
  user: user
)
martini.ingredients << [ingredient_vermouth]
martini.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: ステア

# サンプルカクテル 7: フレンチ75
french_75 = Recipe.create!(
  name: 'フレンチ75',
  alcohol_strength: 'strong',
  difficulty: difficulty_advanced,
  base_liquor: base_gin,
  flavor: sour,
  category_list: '公式',
  user: user
)
french_75.ingredients << [ingredient_lemon_juice, ingredient_sugar, ingredient_champagne]
french_75.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク、ビルド

# サンプルカクテル 8: ピンクレディ
pink_lady = Recipe.create!(
  name: 'ピンクレディ',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_gin,
  flavor: sweet,
  category_list: '公式',
  user: user
)
pink_lady.ingredients << [ingredient_egg_white, ingredient_grenadine, ingredient_lemon_juice]
pink_lady.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# サンプルカクテル 9: オレンジブロッサム
orange_blossom = Recipe.create!(
  name: 'オレンジブロッサム',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_gin,
  flavor: sweet,
  category_list: '公式',
  user: user
)
orange_blossom.ingredients << [ingredient_orange_juice]
orange_blossom.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# サンプルカクテル 10: ギムレット
gimlet = Recipe.create!(
  name: 'ギムレット',
  alcohol_strength: 'strong',
  difficulty: difficulty_advanced,
  base_liquor: base_gin,
  flavor: sour,
  category_list: '公式',
  user: user
)
gimlet.ingredients << [ingredient_lime_juice, ingredient_sugar]
gimlet.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# サンプルカクテル 11: ネグローニ
negroni = Recipe.create!(
  name: 'ネグローニ',
  alcohol_strength: 'medium',
  difficulty: difficulty_medium,
  base_liquor: base_gin,
  flavor: bitter,
  category_list: '公式',
  user: user
)
negroni.ingredients << [ingredient_vermouth, ingredient_campari]
negroni.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: ビルド、ステア

# サンプルカクテル 12: ブルームーン
blue_moon = Recipe.create!(
  name: 'ブルームーン',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_gin,
  flavor: sweet,
  category_list: '公式',
  user: user
)
blue_moon.ingredients << [ingredient_vermouth, ingredient_curacao]
blue_moon.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

margarita = Recipe.create!(
  name: 'マルガリータ',
  alcohol_strength: 'strong',
  difficulty: difficulty_advanced,
  base_liquor: base_tequila,
  flavor: sour,
  category_list: '公式',
  user: user
)
margarita.ingredients << [ingredient_lime_juice, ingredient_triple_sec]
margarita.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# テキーラサンライズ
tequila_sunrise = Recipe.create!(
  name: 'テキーラサンライズ',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_tequila,
  flavor: sweet,
  category_list: '公式',
  user: user
)
tequila_sunrise.ingredients << [ingredient_orange_juice, ingredient_grenadine]
tequila_sunrise.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: ビルド

# パローマ
paloma = Recipe.create!(
  name: 'パローマ',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_tequila,
  flavor: sour,
  category_list: '公式',
  user: user
)
paloma.ingredients << [ingredient_grapefruit_juice, ingredient_soda]
paloma.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: ビルド

# ストローハット
straw_hat = Recipe.create!(
  name: 'ストローハット',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_rum,
  flavor: sweet,
  category_list: '公式',
  user: user
)
straw_hat.ingredients << [ingredient_orange_juice, ingredient_grenadine]
straw_hat.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# エル・ディアブロ
el_diablo = Recipe.create!(
  name: 'エル・ディアブロ',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_tequila,
  flavor: spicy,
  category_list: '公式',
  user: user
)
el_diablo.ingredients << [ingredient_ginger_beer, ingredient_lime_juice]
el_diablo.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# アイスブレイカー
ice_breaker = Recipe.create!(
  name: 'アイスブレイカー',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_vodka,
  flavor: sour,
  category_list: '公式',
  user: user
)
ice_breaker.ingredients << [ingredient_lemon_juice, ingredient_soda]
ice_breaker.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# ブレイブ・ブル
brave_blue = Recipe.create!(
  name: 'ブレイブ・ブル',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_vodka,
  flavor: sweet,
  category_list: '公式',
  user: user
)
brave_blue.ingredients << [ingredient_blue_curacao, ingredient_soda]
brave_blue.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# マタドール
matador = Recipe.create!(
  name: 'マタドール',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_tequila,
  flavor: sour,
  category_list: '公式',
  user: user
)
matador.ingredients << [ingredient_pineapple_juice, ingredient_lime_juice]
matador.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# メキシカン
mexican = Recipe.create!(
  name: 'メキシカン',
  alcohol_strength: 'strong',
  difficulty: difficulty_advanced,
  base_liquor: base_tequila,
  flavor: spicy,
  category_list: '公式',
  user: user
)
mexican.ingredients << [ingredient_tabasco]
mexican.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# モッキンバード
mockingbird = Recipe.create!(
  name: 'モッキンバード',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_rum,
  flavor: sweet,
  category_list: '公式',
  user: user
)
mockingbird.ingredients << [ingredient_sugar, ingredient_egg_white]
mockingbird.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

screwdriver = Recipe.create!(
  name: 'スクリュードライバー',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_vodka,
  flavor: sweet,
  category_list: '公式',
  user: user
)
screwdriver.ingredients << [ingredient_orange_juice]
screwdriver.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: ビルド

moscow_mule = Recipe.create!(
  name: 'モスコミュール',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_vodka,
  flavor: spicy,
  category_list: '公式',
  user: user
)
moscow_mule.ingredients << [ingredient_ginger_ale, ingredient_lime]
moscow_mule.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: ビルド

salty_dog = Recipe.create!(
  name: 'ソルティドッグ',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_vodka,
  flavor: sour,
  category_list: '公式',
  user: user
)
salty_dog.ingredients << [ingredient_grapefruit_juice, ingredient_salt]
salty_dog.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: ビルド

bloody_mary = Recipe.create!(
  name: 'ブラッディーメアリー',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_vodka,
  flavor: spicy,
  category_list: '公式',
  user: user
)
bloody_mary.ingredients << [ingredient_tomato_juice, ingredient_tabasco, ingredient_lemon_juice]
bloody_mary.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

sea_breeze = Recipe.create!(
  name: 'シーブリーズ',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_vodka,
  flavor: sweet,
  category_list: '公式',
  user: user
)
sea_breeze.ingredients << [ingredient_cranberry_juice, ingredient_grapefruit_juice]
sea_breeze.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: ビルド

cosmopolitan = Recipe.create!(
  name: 'コスモポリタン',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_vodka,
  flavor: sweet,
  category_list: '公式',
  user: user
)
cosmopolitan.ingredients << [ingredient_triple_sec, ingredient_cranberry_juice, ingredient_lime]
cosmopolitan.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

bull_shot = Recipe.create!(
  name: 'ブル・ショット',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_vodka,
  flavor: spicy,
  category_list: '公式',
  user: user
)
bull_shot.ingredients << [ingredient_beef_broth, ingredient_tabasco]
bull_shot.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

sex_on_the_beach = Recipe.create!(
  name: 'セックス・オン・ザ・ビーチ',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_vodka,
  flavor: sweet,
  category_list: '公式',
  user: user
)
sex_on_the_beach.ingredients << [ingredient_peach_liqueur, ingredient_cranberry_juice, ingredient_orange_juice]
sex_on_the_beach.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

long_island_iced_tea = Recipe.create!(
  name: 'ロングアイランドアイスティー',
  alcohol_strength: 'strong',
  difficulty: difficulty_advanced,
  base_liquor: base_vodka,
  flavor: sour,
  category_list: '公式',
  user: user
)
long_island_iced_tea.ingredients << [ingredient_gin, ingredient_rum, ingredient_triple_sec, ingredient_lemon_juice,
                                     ingredient_coke]
long_island_iced_tea.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

balalaika = Recipe.create!(
  name: 'バラライカ',
  alcohol_strength: 'medium',
  difficulty: difficulty_medium,
  base_liquor: base_vodka,
  flavor: sweet,
  category_list: '公式',
  user: user
)
balalaika.ingredients << [ingredient_triple_sec, ingredient_lemon_juice]
balalaika.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

kamikaze = Recipe.create!(
  name: 'カミカゼ',
  alcohol_strength: 'medium',
  difficulty: difficulty_medium,
  base_liquor: base_vodka,
  flavor: sour,
  category_list: '公式',
  user: user
)
kamikaze.ingredients << [ingredient_triple_sec, ingredient_lime]
kamikaze.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

black_russian = Recipe.create!(
  name: 'ブラックルシアン',
  alcohol_strength: 'strong',
  difficulty: difficulty_easy,
  base_liquor: base_vodka,
  flavor: bitter,
  category_list: '公式',
  user: user
)
black_russian.ingredients << [ingredient_coffee_liqueur]
black_russian.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

cerbellan_nicola = Recipe.create!(
  name: 'セルベッラニコラ',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_vodka,
  flavor: sweet,
  category_list: '公式',
  user: user
)
cerbellan_nicola.ingredients << [ingredient_lemon_juice, ingredient_soda]
cerbellan_nicola.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# ダイキリ
daiquiri = Recipe.create!(
  name: 'ダイキリ',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_rum,
  flavor: sour,
  category_list: '公式',
  user: user
)
daiquiri.ingredients << [ingredient_lime_juice, ingredient_sugar]
daiquiri.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# モヒート
mojito = Recipe.create!(
  name: 'モヒート',
  alcohol_strength: 'medium',
  difficulty: difficulty_medium,
  base_liquor: base_rum,
  flavor: sour,
  category_list: '公式',
  user: user
)
mojito.ingredients << [ingredient_mint, ingredient_lime_juice, ingredient_soda, ingredient_sugar]
mojito.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: マドリング、ビルド

# クレオパトラ
cleopatra = Recipe.create!(
  name: 'クレオパトラ',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_rum,
  flavor: sweet,
  category_list: '公式',
  user: user
)
cleopatra.ingredients << [ingredient_grenadine, ingredient_lemon_juice]
cleopatra.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# ピニャコラーダ
pina_colada = Recipe.create!(
  name: 'ピニャコラーダ',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_rum,
  flavor: sweet,
  category_list: '公式',
  user: user
)
pina_colada.ingredients << [ingredient_coconut_milk, ingredient_pineapple_juice]
pina_colada.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# メアリー・ピックフォード
mary_pickford = Recipe.create!(
  name: 'メアリー・ピックフォード',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_rum,
  flavor: sweet,
  category_list: '公式',
  user: user
)
mary_pickford.ingredients << [ingredient_grenadine, ingredient_pineapple_juice, ingredient_maraschino]
mary_pickford.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# プラチナブロンド
platinum_blonde = Recipe.create!(
  name: 'プラチナブロンド',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_rum,
  flavor: sweet,
  category_list: '公式',
  user: user
)
platinum_blonde.ingredients << [ingredient_champagne, ingredient_cream]
platinum_blonde.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# キューバリブレ
cuba_libre = Recipe.create!(
  name: 'キューバリブレ',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_rum,
  flavor: sweet,
  category_list: '公式',
  user: user
)
cuba_libre.ingredients << [ingredient_coke, ingredient_lime]
cuba_libre.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: ビルド

# エックスワイジー
xyzy = Recipe.create!(
  name: 'エックスワイジー',
  alcohol_strength: 'strong',
  difficulty: difficulty_advanced,
  base_liquor: base_rum,
  flavor: sour,
  category_list: '公式',
  user: user
)
xyzy.ingredients << [ingredient_lime_juice, ingredient_grenadine]
xyzy.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# マイタイ
mai_tai = Recipe.create!(
  name: 'マイタイ',
  alcohol_strength: 'strong',
  difficulty: difficulty_advanced,
  base_liquor: base_rum,
  flavor: sweet,
  category_list: '公式',
  user: user
)
mai_tai.ingredients << [ingredient_orange_juice, ingredient_orgeat_syrup, ingredient_lime_juice]
mai_tai.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# ブルーハワイ
blue_hawaii = Recipe.create!(
  name: 'ブルーハワイ',
  alcohol_strength: 'strong',
  difficulty: difficulty_advanced,
  base_liquor: base_rum,
  flavor: sweet,
  category_list: '公式',
  user: user
)
blue_hawaii.ingredients << [ingredient_blue_curacao, ingredient_pineapple_juice, ingredient_sweet_and_sour]
blue_hawaii.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
# 作り方: シェイク

# マンハッタン
manhattan = Recipe.create!(
  name: 'マンハッタン',
  alcohol_strength: 'strong',
  difficulty: difficulty_easy,
  base_liquor: base_whiskey,
  flavor: bitter,
  category_list: '公式',
  user: user
)
manhattan.ingredients << [ingredient_vermouth]
manhattan.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# スコッチコリンズ
scotch_collins = Recipe.create!(
  name: 'スコッチコリンズ',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_scotch,
  flavor: sour,
  category_list: '公式',
  user: user
)
scotch_collins.ingredients << [ingredient_soda, ingredient_lemon_juice, ingredient_sugar]
scotch_collins.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# ハイランドクーラー
highland_cooler = Recipe.create!(
  name: 'ハイランドクーラー',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_scotch,
  flavor: sour,
  category_list: '公式',
  user: user
)
highland_cooler.ingredients << [ingredient_soda, ingredient_lemon_juice, ingredient_sugar]
highland_cooler.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# オールド・ファッションド
old_fashioned = Recipe.create!(
  name: 'オールド・ファッションド',
  alcohol_strength: 'strong',
  difficulty: difficulty_medium,
  base_liquor: base_whiskey,
  flavor: bitter,
  category_list: '公式',
  user: user
)
old_fashioned.ingredients << [ingredient_sugar, ingredient_bitters]
old_fashioned.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# ラスティネイル
rusty_nail = Recipe.create!(
  name: 'ラスティネイル',
  alcohol_strength: 'strong',
  difficulty: difficulty_easy,
  base_liquor: base_scotch,
  flavor: sweet,
  category_list: '公式',
  user: user
)
rusty_nail.ingredients << [ingredient_drambuie]
rusty_nail.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# ニューヨーク
new_york = Recipe.create!(
  name: 'ニューヨーク',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_whiskey,
  flavor: sweet,
  category_list: '公式',
  user: user
)
new_york.ingredients << [ingredient_vermouth, ingredient_bitters]
new_york.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# ミント・ジュレップ
mint_julep = Recipe.create!(
  name: 'ミント・ジュレップ',
  alcohol_strength: 'medium',
  difficulty: difficulty_medium,
  base_liquor: base_whiskey,
  flavor: refreshing,
  category_list: '公式',
  user: user
)
mint_julep.ingredients << [ingredient_mint, ingredient_sugar, ingredient_water]
mint_julep.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# ゴッドファーザー
godfather = Recipe.create!(
  name: 'ゴッドファーザー',
  alcohol_strength: 'strong',
  difficulty: difficulty_easy,
  base_liquor: base_scotch,
  flavor: bitter,
  category_list: '公式',
  user: user
)
godfather.ingredients << [ingredient_amaretto]
godfather.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# ロブロイ
rob_roy = Recipe.create!(
  name: 'ロブロイ',
  alcohol_strength: 'strong',
  difficulty: difficulty_easy,
  base_liquor: base_scotch,
  flavor: bitter,
  category_list: '公式',
  user: user
)
rob_roy.ingredients << [ingredient_vermouth]
rob_roy.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# アイリッシュコーヒー
irish_coffee = Recipe.create!(
  name: 'アイリッシュコーヒー',
  alcohol_strength: 'medium',
  difficulty: difficulty_easy,
  base_liquor: base_irish_whiskey,
  flavor: bitter,
  category_list: '公式',
  user: user
)
irish_coffee.ingredients << [ingredient_coffee, ingredient_sugar, ingredient_cream]
irish_coffee.recipe_ingredients.each { |ri| ri.update(quantity: 1) }

# ウイスキーサワー
whiskey_sour = Recipe.create!(
  name: 'ウイスキーサワー',
  alcohol_strength: 'medium',
  difficulty: difficulty_advanced,
  base_liquor: base_whiskey,
  flavor: sour,
  category_list: '公式',
  user: user
)
whiskey_sour.ingredients << [ingredient_lemon_juice, ingredient_sugar, ingredient_egg_white]
whiskey_sour.recipe_ingredients.each { |ri| ri.update(quantity: 1) }
