class Category < ApplicationRecord
    belongs_to :user #para poder asignar user_id a la tabla de articles
    has_many :has_categories #una categoria tiene muchos articulos
    has_many :articles, through: :has_categories # RELACIONA CATEGORIA Y ARTICULO A TRAVES DE HAS_CATEGORIES

    validates :name, :color, presence: true
    validates :name, length: { in: 2..10 }
    validates :name, uniqueness: true 

# https://guides.rubyonrails.org/active_record_validations.html
    
end
