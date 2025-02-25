# frozen_string_literal: true

class Recipe < ApplicationRecord
  acts_as_taggable_on :category #タグ機能

  before_create :add_default_tag

  belongs_to :user
  belongs_to :difficulty
  belongs_to :base_liquor
  belongs_to :flavor

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  has_many :favorites, dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user

  has_one_attached :image

  validates :name, presence: true

  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true, reject_if: :quantity_blank?

  def quantity_blank?(attributes) #フォームがからの場合は、無視
    attributes['quantity'].blank?
  end

  def self.ransackable_attributes(_auth_object = nil) #検索できるもの
    %w[name base_liquor_id difficulty_id]
  end

  enum alcohol_strength: { weak: 0, medium: 1, strong: 2 }

  private

  def add_default_tag #デフォルトタグを追加(公式タグがない時場合は、投稿タグをつける)
    unless category_list.include?("公式")
      self.category_list.add("投稿") unless category_list.include?("投稿")
    end
  end
end
