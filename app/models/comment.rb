class Comment < ActiveRecord::Base

	validates :commenter, presence: true, length: { maximum: 40 }
	validates :body, presence: true

	belongs_to :post
end
