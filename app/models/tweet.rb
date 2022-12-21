class Tweet < ApplicationRecord

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :content, presence: true, length: {maximum: 200}


  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end
