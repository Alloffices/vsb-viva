ActiveAdmin.register CenterEvent do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :center_id, :title, :approved, :start_date, :end_date, :description, :admin_id, :created_by_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:center_id, :title, :approved, :start_date, :end_date, :description, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
   form do |f|
      f.semantic_errors *f.object.errors.keys

      f.inputs "Center Event" do
        f.input :center
        f.input :created_by_id, as: :hidden, :input_html => { value: current_user.id}
        f.input :admin, as: :select, collection: User.where(role: User.roles[:SuperAdmin]).map{ |user| [user.full_name, user.id]}
        f.input :title
        if current_user.role != "Manager"
          f.input :approved
        end
        f.input :start_date, as: :datepicker, :input_html => { :value => (Date.current + 1.month)}
        f.input :end_date, as: :datepicker, :input_html => { :value => (Date.current + 1.month) + 1.day}
        f.input :description
      end
      f.actions
   end

   show do
      attributes_table do
        row :center
        row :title
        row :approved
        row :start_date
        row :end_date
        row :description
      end
   end
end
