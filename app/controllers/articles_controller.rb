class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy] 
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] # AUTENTICADOR DE USUARIOS 
  # se ejecuta antes de los metodos solo en los seleccionados

  # before_action :imprimir, execept: [:index, :show, :update, :destroy]
  # se ejecuta antes de los metodos en todos menos lo seleccionado

  def show
    # no se que hace
  end

  def new
    @article = Article.new
  end

  def create
  # Agrega articulos a la Base de datos
  # Raise params[:article].to_yaml 
    @article = Article.new(article_params)
    respond_to do |format|
      if @article.save
        format.html {redirect_to @article, notice: "Wiii lo creaste" } 
        # colocas el notice en la view y podras verlo igual alert
        format.json {render :show, status: :created, location: @article}
      else
        format.html {redirect_to :new}
        format.json {render json: @article.errors, status: :unprocesable_emtity}
      end  
    end
  end

  def update
  #Este metodo no tiene ninguna vista porque solo es acsesible por formulario
    respond_to do |format|
      if @article.update(article_params)
        format.html {redirect_to @article, notice: "Se modifico con exito"}
        format.json {render :show, status: :created, location: @article}
      else
        format.html {render :edit}
        format.json {render json: @article.errors, status: :unprocesable_emtity}
      end
    end
  end

  def index
    @articulo = Article.all
    #articulo1 = Article.find(1)
    #puts articulo1.title Esto sale por consola, se ve en el servidor
    #puts articulo1.description Esto sale por consola, sale en el servidor
  end

  def edit
  # Funcion estandar qno se si permite editar los articulos de la tabla
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html {redirect_to articles_url, alert: "Articulo eliminado"} #articles_url = articles_path
      format.json {head :no_content}
    end
  end

  private
  def article_params
  # Da permiso a los parametros que se pueden dejar entrar a la base de datos
  # parametros fuertes
    params.require(:article).permit(:title, :description)
  end
  
  def set_article
  # Funcion busca y selecciona selecciona un articulo de la tabla Article 
  # dando como parametro id en el url en la vista de show
    @article = Article.find(params[:id])
  end

  # def imprimir
  #   puts params.to_yaml
  # end
end
