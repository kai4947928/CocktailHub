class Tag < ApplicationRecord
  acts_as_taggable_on :tags
end
