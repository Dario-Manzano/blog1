module PermissionsConcern extend ActiveSupport::Concern

    # Bloque de codigo que me permite devolver true o false si el registro en la db de permission_level coincide
    def is_normal_user?
        self.permission_level == 0
        # sel. toma el objeto, usuario en este caso
        # .permission_level es el nombre de uno de los registros de las db
    end

    def is_editor?
        self.permission_level >= 1
        # COLOCO >= 1 PARA QUE EL ADMIN PUEDA HACER TAMBIEN LO DEL EDITOR.
    end
    
    def is_admin?
        self.permission_level == 2
    end
end