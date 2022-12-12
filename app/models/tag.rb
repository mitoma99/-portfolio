class Tag < ApplicationRecord

  has_many :babyfood_tags, dependent: :destroy
  has_many :babyfoods, through: :babyfood_tags, dependent: :destroy

end
