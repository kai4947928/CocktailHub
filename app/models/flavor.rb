# frozen_string_literal: true

class Flavor < ApplicationRecord
  has_many :recipes
end
