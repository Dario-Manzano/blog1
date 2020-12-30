class AddUserToArticle < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user, null: true, foreign_key: true
    # por alguna razon se coloza ,null: false, esto debe cambiarse al true o eliminarlo, sino al realizar la migracion 
    # genera error porque no acepta registros nulos, 
  end
end
