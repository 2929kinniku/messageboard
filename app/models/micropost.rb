class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  
  def like(micropost)
    # self.favorites.find_or_create_by(user_id: current_user)
    self.favorites.find_or_create_by(micropost_id: micropost.id)
  end

  def unlike(micropost)
    # favorite = self.favorites.find_by(user_id: current_user)
    favorite = self.favorites.find_by(micropost_id: micropost.id)
    favorite.destroy if favorite
  end

  def liking?(micropost)
    self.likings
  end
end
