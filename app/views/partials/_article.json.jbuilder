json.extract! article, :id, :title, :description, :created_at, :updated_at
# json.extract!: es para desarrollar el json

json.url article_url(article, format: :json)  
# Ubicacion url = path, json.path article_path(article, format: :json)