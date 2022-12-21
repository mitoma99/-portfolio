class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :babyfoods, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true, length: {minimum: 2, maximum: 10}
  validates :nickname, presence: true, length: {minimum: 2, maximum: 10}
  validates :introduction, length: {maximum: 30}
  validates :email, presence: true

   def self.guest
    find_or_create_by!(name: 'gestcustomer' ,email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "gestcustomer"
      customer.nickname = "gest"
    end
   end

  def get_image(width, height)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpeg')
    image.attach(io: File.open(file_path), filename: 'no_image.jpeg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_fit: [width, height]).processed
  end

end
