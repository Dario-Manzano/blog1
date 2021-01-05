class Article < ApplicationRecord
    belongs_to :user #para poder asignar user_id a la tabla de articles
    after_create :save_categories
    has_many :has_categories # un articulo tiene muchas categorias
    has_many :categories, through: :has_categories # RELACIONA ARTICULO Y CATEGORIAS A TRAVES DE HAS_CATEGORIES
    
    scope :ultimo, -> {order("created_at DESC")} #metodo para que la base de datos entregue desde el ultimo al primero
    scope :primero, -> {order("created_at ASC")} #metodo para que la base de datos estregue desde el primero al ultimos
    # scope :puntual, -> {where(title:"Polilla")} para realizar una consulta precisa desde el modelo

    #busqueda pasando paramtro desde el controlador, estructura:
    #scope: :my_scope, -> (query) {where("query LIKE ?", "#{query}%")}

    # Coincidencia con cada una de las letras que das, title es la columna en la base de datos. Esta perfecto para buscar
    scope :search, -> (title) {where("title LIKE ?", "#{title}%")}

    #coincidencia exacta con el titulo
    #scope :titulo, -> (find_titulo) {where title: find_titulo}

    validates :title, :description, presence: true
    validates :title, length: {in: 5..25}
    validates :description, length: {minimum: 5}
    validates :title, uniqueness: true 
    #validates :no_save_error

    #custom_setter
    def categories=(value) # se utiliza para asignar los category_id que se reciben desdes el form
        if value != nil
            @categories = value
        #raise @categories.to_yaml
        else
            rais @value
        end
    end

    private
    def save_categories # se crea para asignar a la nueva tabla cada categoria y su articulo
        @categories.each do |category_id|
            #raise @categories.to_yaml
            HasCategory.create(category_id: category_id, article_id: self.id) 
        end
    end
end
