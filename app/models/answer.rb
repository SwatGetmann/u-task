class Answer < ActiveRecord::Base
	belongs_to :task
	belongs_to :user

	def self.is_correct?
		return self.content == self.task.answer
	end
end
