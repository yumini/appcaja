ActiveAdmin.register TipOperacion do
permit_params :nom_opera, :abrev_opera, :tipo_opera, :contable

menu label: 'Tipo Operación' , priority: 4

config.clear_action_items!
action_item only: :index do
  link_to('Añadir Tipo Operacion', new_resource_path)
  
end

action_item only: :show do
  link_to('Editar Tipo Operacion', edit_resource_path)
end

action_item only: :show do

  if controller.action_methods.include?("destroy")
    link_to("Eliminar Tipo Operación", resource_path(resource), 
      :method => :delete, :confirm => "Estas seguro que desea eliminar Esto?")
  end
end
#modificando el index
index  title: "Tipo de Operacion"   do

    column "Nombre de Operacion", :nom_opera
    column "Abreviatura de Operacion", :abrev_opera
    column "Tipo", :tipo_opera
    column "Contable", :contable
    actions
end
filter :nom_opera, label: "Nombre de Operacion"
filter :tipo_opera, label: "Tipo de Operacion"

form  do |f|
	#f.semantic_errors *f.object.errors.keys
	inputs 'Registro de Tipo de Operación' do

		f.input :nom_opera, label: 'Nombre de Operación:', :input_html => { :class => 'some_style', :rows => 2, :style => 'width:20%'}
		f.input :abrev_opera, label: 'Abreviatura de Operación:', :input_html => { :class => 'some_style', :rows => 2, :style => 'width:20%'}
		f.input :tipo_opera, label: 'Tipo de Operación:', collection: TipOperacion.tip_operas.keys, :input_html => { :class => 'some_style', "data-placeholder" => 'Click', :width => 'auto' }
		f.input :contable, label: 'Contable:', collection: TipOperacion.contabs.keys, :input_html => { :class => 'some_style', "data-placeholder" => 'Click', :width => 'auto' }
	end
	
  para "Presiona Cancelar para regresar a la Lista."
    
	f.actions do
    f.action :submit, label: 'Guardar Tipo Operacion'
    f.cancel_link
  end
end

end
