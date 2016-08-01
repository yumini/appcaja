ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :matricula, :nombre, :apepat, :apemat, :role
  #menu false

  menu label: 'Usuarios' , priority: 7
  
  index title: "Usuarios" do
    selectable_column
    id_column
    column :matricula
    column :nombre
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Detalle Usuario" do
      f.input :matricula
      f.input :nombre
      f.input :apepat
      f.input :apemat
      f.input :role, label: 'Puesto:', collection: AdminUser.rols.keys, :input_html => { :class => 'some_style', "data-placeholder" => 'Seleccionar', :width => 'auto' }
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
