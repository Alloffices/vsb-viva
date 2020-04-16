ActiveAdmin.register Tour do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :your_name, :email, :phone, :date, :time, :notes, :contacted_via
  #
  # or
  #
  # permit_params do
  #   permitted = [:your_name, :email, :phone, :date, :time, :notes, :contacted_via]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
