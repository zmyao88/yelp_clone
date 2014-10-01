class Restaurant < ActiveRecord::Base
	has_many  :reviews,     dependent: :destroy
	validates :name,        length: {minimum:3}, uniqueness: true
	validates :description, length: {minimum:1}
	validates :cuisine,     length: {minimum:1}     
end
