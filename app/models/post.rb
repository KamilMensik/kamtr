class Post < ApplicationRecord
	validates :user_id, presence: true
	validates :content, presence: true, length: {minimum: 1}

	belongs_to :user
	has_many :likes, dependent: :destroy

	def liked?(user)
		Like.where(user_id: user.id, post_id: self.id).exists?
	end
end
