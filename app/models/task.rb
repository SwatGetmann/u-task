class Task < ActiveRecord::Base
	validates :name, 	presence: true,
		uniqueness: true
	validates :description, presence:true
	validates :level, presence: true,
		numericality: { only_integer: true, in: 0..5 }
	validates :category, presence: true,
		inclusion: { in: %w(C++ Java Python Ruby),
		message: "must be C++ || Java | Python | Ruby" }
end
