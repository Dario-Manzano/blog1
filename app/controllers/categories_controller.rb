class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] 
  # AUTENTICADOR DE USUARIOS. si no es usuario no puede hacer nada de los que está dentro de [] 
  before_action :authenticate_editor!, only: [:new, :create, :edit, :update]
  before_action :authenticate_admin!, only: [:destroy]
  # se ejecuta antes de los metodos solo en los seleccionados
  # Filtro lo que no pude hace un usuario logueado, uno no logueado SOLO VE todo, uno  editor crea y edita
  # el admin hace lo del editor (se especifica en el modelo) y ademas destruye  

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  def indexuser
    catego = Category.all
    @categories = []
    catego.each do |f|
      if f.user_id == current_user.id 
        @categories.push(f)
      end      
    end
    return @categories
  end


  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = current_user.category.new(category_params)  # si no tengo usuarios Article.new(article_params)
    # pero si coloco usuarios y quiero que los logueados queden registrados al crear articulos, debo
    # colocar current_user.article.new(article_params) current_user(verifica que esté logueado) puede colocarse ç
    # antes de article solo si en el modelo de article.rb, esta belons_to :user (que tambien pertenecea a usuario)
    # solo asociar, se debe definir las restricciones para elimina

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render new_category_path } # new_category_path = a :new
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: "Categoria actualizada satisfactoriamente." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    redirect_to categories_url, alert: 'Category was successfully destroyed.'
    # respond_to do |format|
    #   format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :color)
    end
end
