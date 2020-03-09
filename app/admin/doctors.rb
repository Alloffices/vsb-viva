ActiveAdmin.register Doctor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :language,:region_id,:education, :certifications, :biography, :video_id, :headshot_yext, :headshot_source ,
    doctor_specialities_attributes: [:id ,:doctor_id,:speciality_id] , doctor_insurances_attributes: [:id , :doctor_id , :insurance_id] , 
    doctor_types_attributes: [:id , :doctor_id,:physician_type_id]


    form do |f|
      f.semantic_errors *f.object.errors.keys

      f.inputs "Doctor" do
        f.input :name
        f.input :region_id,:as => :select, :collection => Region.all ,:member_label => :state
        f.input :language
        f.input :education 
        f.input :certifications
        f.input :biography
        f.input :video_id
        f.input :headshot_yext
        f.input :headshot_source

        f.has_many :doctor_types do |n_f|
          n_f.input :physician_type
        end

        f.has_many :doctor_specialities do |n_f|
          n_f.input :speciality
        end
        
        f.has_many :doctor_insurances do |n_f|
          n_f.input :insurance ,:member_label => :insurance_name
        end
        
      end
      f.actions
    end

    show do 
      attributes_table do
        row :name
        row :region
        row :language
        row :education 
        row :certifications
        row :biography
        row :video_id
        row :region
        row :headshot_yext
        row :headshot_source
        attributes_table :physician_types ,:title => "Physician Type"
        attributes_table :insurances ,:member_label => :insurance_name,:title => "Insurances"
        attributes_table :specialities ,:title => "Specialities"
      end
    end

    
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :language, :education, :certifications, :biography, :video_id, :headshot_yext, :headshot_source]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
