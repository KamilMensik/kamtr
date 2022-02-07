class Post < ApplicationRecord
	validates :user_id, presence: true
	validates :content, presence: true, length: {minimum: 1}

	belongs_to :user
end
