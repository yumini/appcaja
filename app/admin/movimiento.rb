ActiveAdmin.register Movimiento do

permit_params  :cuenta_id, :tipoperacion_id, :fecha, :monto


config.per_page = 15
menu label: 'Movimientos' , priority: 6
#modificando el index
index do
	
	column "Cliente", :cuenta, :sortable => :cuenta do |movimiento|
      movimiento.cuenta.numero_cta.blank? ? "N/A" : link_to([movimiento.cuenta.cliente.nombre,movimiento.cuenta.cliente.apepat,movimiento.cuenta.cliente.apemat].join(' '), admin_cliente_path(movimiento.cuenta.cliente))
    end
    column "Fecha de Movimiento", :fecha
    column "Cuenta", :cuenta do |movimiento|
      movimiento.cuenta.numero_cta.blank? ? "N/A" : link_to([movimiento.cuenta.numero_cta, movimiento.cuenta.moneda.nom_moneda].join(' - '), admin_cuenta_path(movimiento.cuenta))
    end
    column "Tipo Operacion", :tipoperacion do |movimiento|
    	 [movimiento.tipoperacion.abrev_opera,movimiento.tipoperacion.nom_opera].join(' - ')
    end
    column "monto", :monto, :sortable => :monto do |movimiento|
    if movimiento.tipoperacion.tipo_opera == "Ingreso"
      div :class => 'price' do
      	number_to_currency(movimiento.monto,  unit: movimiento.cuenta.moneda.simb_moneda)
      end
    else
      div :class => 'price4' do
        "-"+number_to_currency(movimiento.monto,  unit: movimiento.cuenta.moneda.simb_moneda)
      end
    end
      
    end

    actions
end

filter :cuenta,:as => :select, :collection => proc { Cuenta.all.collect{|cuenta| [[cuenta.numero_cta,cuenta.cliente.nombre,cuenta.cliente.apepat,cuenta.cliente.apemat].join('-'), cuenta.id] }}, :class => "chzn-select" 
filter :fecha

#modificando el formulario
form do |f|
	#para mostrar el panel de errores
	#f.semantic_errors *f.object.errors.keys
	#pintado el formulario
	inputs 'Registro de Movimiento' do

		f.input :cuenta_id, label: 'Cuenta:',  as: :select, :collection => Cuenta.all.collect {|cuenta| [[ cuenta.cliente.apepat, cuenta.cliente.apemat, cuenta.cliente.nombre,'Nro. Cuenta' ,cuenta.numero_cta,' Moneda ' ,cuenta.moneda.simb_moneda ].join(' '), cuenta.id] }, :input_html => { "data-placeholder" => 'Seleccionar', :style => 'width:30%' }
		f.input :tipoperacion_id, label: 'Tipo de Operacion', as: :select, :collection => TipOperacion.all.collect {|tipop| [[tipop.abrev_opera,tipop.nom_opera].join('-'),tipop.id]}, :input_html => { "data-placeholder" => 'Seleccionar', :style => 'width:30%' }
		f.input :monto, label: 'Monto:', :as => :string, :input_html => { :class => 'some_style', :rows => 2, :style => 'width:30%', :maxlength => 14}
		f.input :fecha, :as => :datepicker, :input_html => { :class => 'some_style', :rows => 2, :style => 'width:30%'}
	end
	
    para "Presiona Cancelar para regresar a la Lista."
    #para mostrar los botones guardar y cancelar por default
	actions
end
#modificamos el controlador base de movimiento
controller do
  #modificamos el metodo create
  def create
    @movimiento = Movimiento.new(permitted_params[:movimiento])
    if @movimiento.tipoperacion.tipo_opera == "Ingreso"
      @movimiento.cuenta.saldo += @movimiento.monto
    else
      @movimiento.cuenta.saldo -= @movimiento.monto
    end
    @movimiento.cuenta.save
    @movimiento.save
    redirect_to resource_path
  end
end



end
