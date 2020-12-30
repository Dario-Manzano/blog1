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
    @article = current_user.article.new(article_params) # si no tengo usuarios Article.new(article_params)
    # pero si coloco usuarios y quiero que los logueados queden registrados al crear articulos, debo
    # colocar current_user.article.new(article_params) current_user(verifica que esté logueado) puede colocarse ç
    # antes de article solo si en el modelo de article.rb, esta belons_to :user (que tambien pertenecea a usuario)
    # solo asociar, se debe definir las restricciones para eliminar
    
    respond_to do |format|
      if @article.save
        # raise @article.to_yaml
        format.html {redirect_to @article, notice: "Wiii lo creaste" } 
        # colocas el notice en la view y podras verlo igual alert
        format.json {render :show, status: :created, location: @article}
      else
        format.html {render :new} # {redirect_to article_path} si coloco esto no me acepta el if de la validacion
        # redirect_to te lleva a otra pagina sin datos previos, render te lleva o llama otra pagina con los datos previos
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
