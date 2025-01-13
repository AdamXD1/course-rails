class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable 

  #Esto es la relacion que hay con la tabla seccions.
  #El dependent lo que hace es borrar un registro que tengan varios registros dentro
  has_many :sections, dependent: :destroy
  has_many :surveys, dependent: :destroy

end
