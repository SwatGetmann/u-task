json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :description, :category, :level, :rating
  json.url task_url(task, format: :json)
end
