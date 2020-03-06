ActiveAdmin.register Center do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  #
  permit_params :name, :user_id, :address_1, :address_2, :city, :state, :zip_code, :county, :primary_phone, :additional_phones, :fax, :pharmacy, :humana, :monday_hours, :tuesday_hours, :wednesday_hours, :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours, :special_hours, :lat, :lng, :calendar_notes, :approved_calendar_notes, :monday_ext_hours, :tuesday_ext_hours, :wednesday_ext_hours, :thursday_ext_hours, :friday_ext_hours, :saturday_ext_hours, :sunday_ext_hours
 

  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :user_id, :address_1, :address_2, :city, :state, :zip_code, :county, :primary_phone, :additional_phones, :fax, :pharmacy, :humana, :monday_hours, :tuesday_hours, :wednesday_hours, :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours, :special_hours, :lat, :lng, :calendar_notes, :approved_calendar_notes, :monday_ext_hours, :tuesday_ext_hours, :wednesday_ext_hours, :thursday_ext_hours, :friday_ext_hours, :saturday_ext_hours, :sunday_ext_hours]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
