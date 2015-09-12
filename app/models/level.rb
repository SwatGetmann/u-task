class Level < ActiveRecord::Base
	has_many :tasks
	validates :name, presence: true, uniqueness: true
	validates :value, presence: true, uniqueness: true,
		numericality: { greater_than_or_equal_to: 1, only_integer: true }
end
