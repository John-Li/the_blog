class Post < ActiveRecord::Base
  attr_accessible :title, :content

	validates :title, presence: true, length: { minimum: 5 }
	validates :content, presence: true

	has_many :comments, dependent: :destroy
	belongs_to :category
	belongs_to :user

  default_scope order: 'posts.created_at DESC'
end
