class Babyfood < ApplicationRecord

  belongs_to :customer
  has_one_attached :image
  belongs_to :tag

  validates :title, presence: true, length: {maximum: 20}
  validates :food, presence: true
  validates :point, presence: true
  validates :making, presence: true

  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/default-image.jpeg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_fit: [width, height]).processed
  end


end
