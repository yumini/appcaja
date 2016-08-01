class Cuenta < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :moneda
  has_one :movimientos
  validates :cliente_id, :presence => { message: "Seleccione Cliente" }
  validates :moneda_id, :presence => { message: "Seleccione Moneda" }
  validates :numero_cta, :presence=> { message: "Ingrese Numero de Cuenta"} , :numericality => {:only_integer => true, :message => "Debe ingresar solo números"}
  
end
