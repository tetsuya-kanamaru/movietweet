class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :attachment

  def self.search(search)
    if search != ""
      Tweet.where('title LIKE(?)', "&#{search}%")
    else
      Tweet.all
    end
  end
end
