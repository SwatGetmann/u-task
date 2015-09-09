class Category < ActiveRecord::Base
	has_many :tasks
	validates :name, presence: true

	def default_category
		return Category.new(name: "NO CATEGORY, PLEASE EDIT")
	end
end
