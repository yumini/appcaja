ActiveAdmin.register Cuenta do
permit_params :numero_cta, :moneda_id, :cliente_id, :saldo
menu label: 'Cuentas' , priority: 5
#para que la paginación sea de 15 en 15
config.per_page = 15
#modificando el index
index do
    column "Cliente", :cliente do |cuenta|
      cuenta.cliente.blank? ? "N/A" : link_to([cuenta.cliente.nombre,cuenta.cliente.apepat,cuenta.cliente.apemat].join(' '), admin_cliente_path(cuenta.cliente))
    end
    column "Moneda", :moneda do |cuenta|
    	 cuenta.moneda.blank? ? "N/A" : link_to([cuenta.moneda.abrev_moneda,cuenta.moneda.nom_moneda,cuenta.moneda.simb_moneda].join(' - '), admin_moneda_path(cuenta.moneda))
    end
    column "Numero de Cuenta", :numero_cta

    column "Saldo", :saldo, :sortable => :saldo do |cuenta|
      div :class => 'price' do
        number_to_currency(cuenta.saldo,  unit: cuenta.moneda.simb_moneda)
      end
      
    end
    actions
end
filter :numero_cta, label: "Numero de Cuenta"
filter :cliente,:as => :select, :collection => proc { Cliente.all.collect{|cliente| [cliente.nombre, cliente.id] }}, :class => "chzn-select" 

#modificando el formulario
form do |f|
	#para mostrar el panel de errores
	#f.semantic_errors *f.object.errors.keys
	#pintado el formulario
    sald=0
	inputs 'Registro de Cuenta de Cliente' do
        
		f.input :cliente_id, label: 'Cliente:',  as: :select, :collection => Cliente.all.collect {|cliente| [[ cliente.apepat, cliente.apemat, cliente.nombre ].join(' '), cliente.id] }, :input_html => { "data-placeholder" => 'Seleccionar', :style => 'width:30%' }
		f.input :moneda_id, label: 'Moneda:', as: :select, :collection => Moneda.all.collect {|moneda| [[ moneda.nom_moneda, moneda.simb_moneda ].join(' - '), moneda.id] }, :input_html => { "data-placeholder" => 'Seleccionar', :style => 'width:10%' }
		f.input :numero_cta, label: 'Numero Cuenta:', :as => :string, :input_html => { :class => 'some_style', :rows => 2, :style => 'width:30%', :maxlength => 14}
		f.input :saldo, label: "Saldo", as: :hidden, :input_html => { :value => sald }
	end
	
    para "Presiona Cancelar para regresar a la Lista."
    #para mostrar los botones guardar y cancelar por default
	actions
end
#modificando el show
show do
   panel "Detalles de Cuenta" do
      attributes_table_for cuenta do 
        row :cliente do |cuenta|
        	[cuenta.cliente.nombre,cuenta.cliente.apepat,cuenta.cliente.apemat].join(' ')
        end
        row :moneda do |cuenta|
        	[cuenta.moneda.abrev_moneda,cuenta.moneda.nom_moneda,cuenta.moneda.simb_moneda].join(' - ')
        end
        row :numero_cta

        row "Saldo", :saldo, :sortable => :saldo do |cuenta|
          if cuenta.saldo == 0   
              div :class => 'price3' do
                number_to_currency(cuenta.saldo,  unit: cuenta.moneda.simb_moneda)
              end
          end
          if cuenta.saldo > 0
             div :class => 'price2' do
                number_to_currency(cuenta.saldo,  unit: cuenta.moneda.simb_moneda)
              end
          end

      
        end

       
      end
    end
    active_admin_comments
end

end
