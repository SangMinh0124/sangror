json.extract! todo, :id, :title, :cre_todo, :created_at, :updated_at
json.url todo_url(todo, format: :json)
