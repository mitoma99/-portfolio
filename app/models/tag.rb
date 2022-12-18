class Tag < ApplicationRecord

  has_many :babyfoods, dependent: :destroy

end
