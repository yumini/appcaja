class TipOperacion < ActiveRecord::Base
	has_one :movimientos
	enum tip_opera: [:Ingreso, :Salida] 
	enum contab: [:Si, :No]
	validates :nom_opera, :abrev_opera, :tipo_opera, :contable,  :presence => { message: "Campo no puede dejarse vacío" }
end
