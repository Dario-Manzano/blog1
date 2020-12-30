class Category < ApplicationRecord
    belongs_to :user #para poder asignar user_id a la tabla de articles
end
