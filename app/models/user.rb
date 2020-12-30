class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :article # o :articles  PARA INDICAR QUE UN USUARIO PUEDE ESTAR ASOCIANO A MUCHOS ARTICULOS y muchas categorias
  has_many :category # O :categories
end
