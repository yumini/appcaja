class Cliente < ActiveRecord::Base
	has_many :cuentas
	enum tipodoc: [:DNI, :RUC]
	validates :nombre, :numdoc, :direccion,  :presence => { message: "Campo no puede dejarse vacío" }
	validates :tipdoc, :presence => { message: "Seleccione Tipo de Documento" }
end
