class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6}
  validates :password_confirmation, presence: true
  
  def remember_me
    true
  end
end

