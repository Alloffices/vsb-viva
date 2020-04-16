ActiveAdmin.register CenterDoctor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  config.sort_order = 'id_asc'
   permit_params :doctor_id, :center_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:doctor_id, :center_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
