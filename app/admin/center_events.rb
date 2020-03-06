ActiveAdmin.register CenterEvent do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :center_id, :title, :approved, :start_date, :end_date, :description, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:center_id, :title, :approved, :start_date, :end_date, :description, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
