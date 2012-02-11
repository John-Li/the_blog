class Category < ActiveRecord::Base
	has_many :posts

  validates :name, presence: true, uniqueness: { case_sensetive: false }
end
