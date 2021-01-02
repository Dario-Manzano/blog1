class Article < ApplicationRecord
    belongs_to :user #para poder asignar user_id a la tabla de articles
    after_create :save_categories
    has_many :has_categories # un articulo tiene muchas categorias
    has_many :categories, through: :has_categories # RELACIONA ARTICULO Y CATEGORIAS A TRAVES DE HAS_CATEGORIES
    

    validates :title, :description, :categories, presence: true
    validates :title, length: {in: 5..25}
    validates :description, length: {minimum: 5}
    validates :title, uniqueness: true 
   
    def categories=(value) # se utiliza para asignar los category_id que se reciben desdes el form
        @categories = value
        #raise @categories.to_yaml
    end
    
    private
    def save_categories # se crea para asignar a la nueva tabla cada categoria y su articulo
        @categories.each do |category_id|
            # raise @categories.to_yaml
            HasCategory.create(category_id: category_id, article_id: self.id) 
        end
    end
end
