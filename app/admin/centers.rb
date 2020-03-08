ActiveAdmin.register Center do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  #
  permit_params :name, :user_id, :address_1, :address_2, :city, :state, :zip_code, :county, :primary_phone, :additional_phones, :fax, :pharmacy, :humana, :monday_hours, :tuesday_hours, :wednesday_hours, :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours, :special_hours, :lat, :lng, :calendar_notes, :approved_calendar_notes, :monday_ext_hours, :tuesday_ext_hours, :wednesday_ext_hours, :thursday_ext_hours, :friday_ext_hours, :saturday_ext_hours, :sunday_ext_hours , 
    center_doctors_attributes: [:id,:doctor_id,:center_id,:_destroy] , center_specialities_attributes: [:id,:center_id,:speciality_id,:_destroy] , center_services_attributes: [:id,:center_id,:service_id,:_destroy],
    center_events_attributes: [:id,:center_id,:title,:start_date,:end_date,:description]
 
  form do |f| 
    f.semantic_errors *f.object.errors.keys
    f.inputs "Center" do
      f.input :name
      f.input :user_id , :as => :select, :collection => User.all ,:member_label => :email
      f.input :address_1 
      f.input :address_2
      f.input :city
      f.input :state
      f.input :zip_code
      f.input :county
      f.input :primary_phone
      f.input :additional_phones
      f.input :fax
      f.input :pharmacy
      f.input :humana
      f.input :monday_hours
      f.input :tuesday_hours
      f.input :wednesday_hours
      f.input :thursday_hours
      f.input :friday_hours 
      f.input :saturday_hours
      f.input :sunday_hours
      f.input :special_hours
      f.input :lat
      f.input :lng
      f.input :monday_ext_hours
      f.input :tuesday_ext_hours
      f.input :wednesday_ext_hours
      f.input :thursday_ext_hours
      f.input :friday_ext_hours
      f.input :saturday_ext_hours
      f.input :sunday_ext_hours

      f.has_many :center_doctors do |n_f|
        n_f.input :doctor
      end

      f.has_many :center_specialities do |n_f|
        n_f.input :speciality
      end 

      f.has_many :center_services   do |n_f|
        n_f.input :service
      end 
      # f.has_many :center_events ,new_record:true do |n_f|
      #   n_f.input :title
      #   n_f.input :description
      # end
    end
    f.actions
  end 

  index do 
    column :name
    column :user_id
    column :city 
    column :county
    column :zip_code
    column :state
    actions
  end 
  
  show do 
    attributes_table do
      row :name
      row :user_id
      row :address_1 
      row :address_2
      row :city
      row :state
      row :zip_code
      row :county
      row :primary_phone
      row :additional_phones
      row :fax
      row :pharmacy
      row :humana
      row :monday_hours
      row :tuesday_hours
      row :wednesday_hours
      row :thursday_hours
      row :friday_hours 
      row :saturday_hours
      row :sunday_hours
      row :special_hours
      row :lat
      row :lng
      row :monday_ext_hours
      row :tuesday_ext_hours
      row :wednesday_ext_hours
      row :thursday_ext_hours
      row :friday_ext_hours
      row :saturday_ext_hours
      row :sunday_ext_hours
   
      attributes_table :doctors ,:title => "Doctors"
      attributes_table :specialities ,:title => "Specialities"
      attributes_table :services ,:title => "Services"
      attributes_table :center_events ,:title => "Events"
     end
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :user_id, :address_1, :address_2, :city, :state, :zip_code, :county, :primary_phone, :additional_phones, :fax, :pharmacy, :humana, :monday_hours, :tuesday_hours, :wednesday_hours, :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours, :special_hours, :lat, :lng, :calendar_notes, :approved_calendar_notes, :monday_ext_hours, :tuesday_ext_hours, :wednesday_ext_hours, :thursday_ext_hours, :friday_ext_hours, :saturday_ext_hours, :sunday_ext_hours]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
