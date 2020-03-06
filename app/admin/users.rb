ActiveAdmin.register User do
  permit_params :email, :password,:first_name,:last_name,:role, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :role
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :first_name
      f.input :last_name
      f.input :role
      f.input :password_confirmation
    end
    f.actions
  end

end
