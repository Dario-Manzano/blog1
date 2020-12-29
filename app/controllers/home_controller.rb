class HomeController < ApplicationController
    def index 
        #Article.all Article es una tabla de la db se crea como class
        @articulo = Article.all # para poder utilizar la variable articulo en la views
    end
    
    def contact
        @name = "Dario"
        @lastname = "Manzano"
        @lista = [0, 1, 2, 3, 4]
    end
end