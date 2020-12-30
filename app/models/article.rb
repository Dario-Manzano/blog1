class Article < ApplicationRecord
    belongs_to :user #para poder asignar user_id a la tabla de articles
    validates :title, :description, presence: true

end
