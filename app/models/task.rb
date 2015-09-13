class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	belongs_to :level

	validates :name, 	presence: true,
		uniqueness: true
	validates :description, presence:true
	validates :category, presence: true

	acts_as_taggable_on :tags

	def default_level
		return Level.new(name: "NO LEVEL, PLEASE EDIT")
	end

	def default_category
		return Category.new(name: "NO CATEGORY, PLEASE EDIT")
	end

	def show_level
		self.level = default_level if self.level.nil?
		self.level.name
	end

	def show_category
		self.category = default_category if self.category.nil?
		self.category.name
	end
end
