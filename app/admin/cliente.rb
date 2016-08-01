ActiveAdmin.register Cliente do
#admitiendo los parametros
permit_params :nombre, :apepat, :apemat, :tipdoc, :numdoc, :direccion, :fecnac, :tfno, :celular
menu label: 'Cliente' , priority: 2
config.per_page = 15

#modificando el index
index do
	
  	column "Nombre", :nombre
	column "Paterno", :apepat
	column "Materno", :apemat
	column "Tipo Documento", :tipdoc
	column "Numero Documento", :numdoc
	column "Direccion", :direccion
	
	
    actions
end
#seccion de filtros
filter :nombre, label: "Nombre"
filter :tipdoc, label: "Tipo Documento"
filter :numdoc, label: "Numero Documento"

#modificando el formulario
form do |f|
	#para mostrar el panel de errores
	#f.semantic_errors *f.object.errors.keys
	#pintado el formulario
	inputs 'Registro de Cliente' do

		f.input :nombre, label: 'Nombre:', :input_html => { :class => 'some_style', :rows => 2, :style => 'width:30%'}
		f.input :apepat, label: 'Apellido Paterno:', :input_html => { :class => 'some_style', :rows => 2, :style => 'width:30%'}
		f.input :apemat, label: 'Apellido Materno:', :input_html => { :class => 'some_style', :rows => 2, :style => 'width:30%'}
		f.input :tipdoc, label: 'Tipo Documento:', collection: Cliente.tipodocs.keys, :input_html => { :class => 'some_style', "data-placeholder" => 'Seleccionar', :width => 'auto' }
		f.input :numdoc, label: 'Numero Documento:', :input_html => { :class => 'some_style', :rows => 2, :style => 'width:10%'}
		f.input :direccion, label: 'Direccion:', :input_html => { :class => 'some_style', :rows => 2, :style => 'width:30%'}
		f.input :fecnac, label: 'Fecha Nacimiento:', as: :datepicker, datepicker_options: {dateFormat: 'dd/mm/yy'}, :input_html => { :class => 'some_style', :rows => 2, :style => 'width:10%'}
		f.input :tfno, label: 'Telefono:', :input_html => { :class => 'some_style', :rows => 2, :style => 'width:30%'}
		f.input :celular, label: 'Celular:', :input_html => { :class => 'some_style', :rows => 2, :style => 'width:30%'}

	end
	
    para "Presiona Cancelar para regresar a la Lista."
    #para mostrar los botones guardar y cancelar por default
	actions
end

end
