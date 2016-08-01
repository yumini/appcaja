class Movimiento < ActiveRecord::Base
  belongs_to :cuenta
  belongs_to :tipoperacion, :class_name => 'TipOperacion'

 
end
