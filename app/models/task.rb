class Task < ActiveRecord::Base
	validates :name, 	presence: true,
		uniqueness: true
	validates :description, presence:true
	# validates :category, presence: true
	belongs_to :category
	belongs_to :level
end
