ActiveAdmin.register Doctor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :language, :education, :certifications, :biography, :video_id, :headshot_yext, :headshot_source
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :language, :education, :certifications, :biography, :video_id, :headshot_yext, :headshot_source]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
