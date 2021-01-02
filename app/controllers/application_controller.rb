class ApplicationController < ActionController::Base
    before_action :category_viewer

    def category_viewer
        @category_viewer = Category.all
    end

    protected
    # Esto se coloca aquí para poder autenticar los usuarios como admin y editores desde el 
    # controlador y que se refleje en las vistas
    def authenticate_editor!
      redirect_to root_path, notice: "no tienes permiso wey" unless user_signed_in? && current_user.is_editor?
    end
    def authenticate_admin!
      redirect_to root_path, notice: "no tienes permiso wey" unless user_signed_in? && current_user.is_admin?
    end

end
