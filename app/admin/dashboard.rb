ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    panel "Movimientos Recientes" do
        ol do
        table_for Movimiento.order("created_at desc").limit(5) do
            column "Fecha", :fecha
            column "cuenta", :cuenta do |movimiento|
              movimiento.cuenta.numero_cta
            end
            column "Tipo Operacion", :tipoperacion do |movimiento|
              [movimiento.tipoperacion.abrev_opera,movimiento.tipoperacion.nom_opera].join(' - ')
            end
            column "monto", :monto, :sortable => :monto do |movimiento|
                 div :class => 'price' do
                    number_to_currency(movimiento.monto,  unit: movimiento.cuenta.moneda.simb_moneda)
                end
      
            end
        end
        strong {link_to "Ver Todos los Movimientos", admin_movimientos_path}
        end
    end

    panel "Clientes Recientes" do
        ol do
            table_for Cliente.order("created_at desc").limit(5) do
                column "Nombres y Apellidos", :nombre  do |cliente|
                     [cliente.nombre,cliente.apepat,cliente.apemat].join(' ')
                end
                column "Tipo Documento", :tipdoc
                column "Numero Documento", :numdoc
                column "Direccion", :direccion
            end
        end
        strong {link_to "Ver Todos los Clientes", admin_clientes_path}
    end
    
  end # content
end
