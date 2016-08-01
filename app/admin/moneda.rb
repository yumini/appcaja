ActiveAdmin.register Moneda do
permit_params :nom_moneda, :simb_moneda, :abrev_moneda

menu label: 'Moneda' , priority: 3


index do
    column "Nombre de Moneda", :nom_moneda
    column "simbolo de Moneda", :simb_moneda
    column "Abreviatura de Moneda", :abrev_moneda
    actions
end
filter :nom_moneda, label: "Nombre de Moneda"
filter :simb_moneda, label: "Simbolo de Moneda"

form do |f|
	#f.semantic_errors *f.object.errors.keys
	inputs 'Registro de Moneda' do

		f.input :nom_moneda, label: 'Nombre de Moneda       :', :input_html => { :class => 'some_style', :rows => 2, :style => 'width:20%'}
		f.input :simb_moneda, label: 'Simbolo de Moneda     :', :input_html => { :class => 'some_style', :rows => 2, :style => 'width:20%'}
		f.input :abrev_moneda, label: 'Abreviatura de Moneda:', :input_html => { :class => 'some_style', :rows => 2, :style => 'width:20%'}
	end
	
    para "Presiona Cancelar para regresar a la Lista."
    
	actions
end



end
