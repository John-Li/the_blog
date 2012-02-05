class User < ActiveRecord::Base
	attr_accessible :name, :email

	validates :name,  presence: true, length: { maximum: 40 }
	valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: valid_email_regex },
										uniqueness: { case_sensetive: false }
end
