class Moneda < ActiveRecord::Base
	has_many :cuentas
	validates :nom_moneda, :simb_moneda, :abrev_moneda,  :presence => { message: "Campo no puede dejarse vacío" }
end
