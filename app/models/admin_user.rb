class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  enum rol: [:'Supervisor', :'Promotor Principal', :'Promotor Servicio']

  validates :nombre, :presence => { message: "Ingrese matricula" }
  validates :nombre, :presence => { message: "Ingrese nombre" }
  validates :apepat, :presence => { message: "Ingrese Apellido Paterno" }
  validates :apemat, :presence => { message: "Ingrese Apellido Materno" }
  validates :role, :presence => { message: "Seleccione Rol" }
  validates :email, :presence => { message: "Ingrese correo electrónico" }
  validates :password, :presence => { message: "Ingrese password" }
  validates :password_confirmation, :presence => { message: "Confirme password" }
end
