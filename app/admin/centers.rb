ActiveAdmin.register Center do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment

  #
  permit_params :name, :state, :address_1, :address_2, :city, :county,:location_description_id, :primary_phone, :additional_phones,
                :fax,  :monday_hours, :tuesday_hours, :wednesday_hours, :center_admin, :latitude, :longitude,
                :thursday_hours, :friday_hours, :saturday_hours, :sunday_hours, :special_hours, :calendar_notes,
                :approved_calendar_notes, :monday_ext_hours, :tuesday_ext_hours, :wednesday_ext_hours,
                :thursday_ext_hours, :friday_ext_hours, :saturday_ext_hours, :sunday_ext_hours,
                doctor_ids: [], speciality_ids: [], service_ids: [], center_event_ids: [], insurance_ids: [], images: [],
    center_doctors_attributes: [:id,:doctor_id,:center_id,:_destroy],
                center_specialities_attributes: [:id,:center_id,:speciality_id,:_destroy],
                center_services_attributes: [:id,:center_id,:service_id,:_destroy],
    center_events_attributes: [:id,:center_id,:title,:start_date,:end_date,:description]

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Center" do

      f.input :name
      f.input :center_admin
      f.input :address_1
      f.input :address_2
      f.input :city
      f.input :state
      f.input :county
      f.input :primary_phone
      f.input :additional_phones
      f.input :fax
      f.input :location_description , :member_label => :description
      f.input :latitude
      f.input :longitude
      columns class: 'working-hours' do
        columns class: 'hours' do
          columns class: 'width-30' do
            f.input :monday_hours
          end

          columns class: 'width-30' do
            f.input :monday_ext_hours
          end
        end

        columns class: 'hours' do
          columns class: 'width-30' do
            f.input :tuesday_hours
          end
          columns class: 'width-30' do
            f.input :tuesday_ext_hours
          end
        end

        columns class: 'hours' do
          columns class: 'width-30' do
            f.input :wednesday_hours
          end
          columns class: 'width-30' do
            f.input :wednesday_ext_hours
          end
        end

        columns class: 'hours' do
          columns class: 'width-30' do
            f.input :thursday_hours
          end
          columns class: 'width-30' do
            f.input :thursday_ext_hours
          end
        end

        columns class: 'hours' do
          columns class: 'width-30' do
            f.input :friday_hours
          end
          columns class: 'width-30' do
            f.input :friday_ext_hours
          end
        end
        columns class: 'hours' do
          columns class: 'width-30' do
            f.input :saturday_hours
          end
          columns class: 'width-30' do
            f.input :saturday_ext_hours
          end
        end

        columns class: 'hours' do
          columns class: 'width-30' do
            f.input :sunday_hours
          end
          columns class: 'width-30' do
            f.input :sunday_ext_hours
          end
        end
      end
      f.input :doctors, as: :select, :input_html => {class: 'multiselect'}
      f.input :specialities, as: :select, :input_html => {class: 'multiselect'}
      f.input :services, as: :select, :input_html => {class: 'multiselect'}
      f.input :insurances, as: :select, :member_label => :insurance_name, :input_html => {class: 'multiselect'}
      f.inputs 'Gallery' do
        f.file_field :images, multiple: true
      end
      ul class: 'inline-images' do
        if center.images.attached?
          center.images.each do |photo|
            li do
              image_tag url_for(photo), width: 100, height: 100
            end
          end
        else
          li do
            "images not found"
          end
        end
      end
      # f.has_many :center_events ,new_record:true do |n_f|
      #   n_f.input :title
      #   n_f.input :description
      # end
    end
    f.actions
  end

  index do
    column :id
    column :name
    column :center_admin
    column :city
    column :county
    column :state
    actions
  end

  show do
    attributes_table do
      row :name
      row :center_admin
      row :address_1
      row :address_2
      row :city
      row :zip_code
      row :state
      row :county
      row :primary_phone
      row :additional_phones
      row :calendar_notes
      row :location_description
      row :fax
      unless resource.monday_hours.nil?
        row 'Monday hours', class: 'show-working-hours' do
          columns resource.monday_hours.strftime('%l:%M %P')
          columns resource.monday_ext_hours.strftime('%l:%M %P')
        end
      end 
      unless resource.tuesday_hours.nil?
        row 'Tuesday hours', class: 'show-working-hours' do
          columns resource.tuesday_hours.strftime('%l:%M %P')
          columns resource.tuesday_ext_hours.strftime('%l:%M %P')
        end
      end
      unless resource.wednesday_hours.nil?
        row 'Wednesday hours', class: 'show-working-hours' do
          columns resource.wednesday_hours.strftime('%l:%M %P')
          columns resource.wednesday_ext_hours.strftime('%l:%M %P')
        end
      end
      unless resource.thursday_hours.nil?
        row 'Thursday hours', class: 'show-working-hours' do
          columns resource.thursday_hours.strftime('%l:%M %P')
          columns resource.thursday_ext_hours.strftime('%l:%M %P')
        end
      end

      unless resource.friday_hours.nil?
        row 'Friday hours', class: 'show-working-hours' do
          columns resource.friday_hours.strftime('%l:%M %P')
          columns resource.friday_ext_hours.strftime('%l:%M %P')
        end
      end
      unless resource.saturday_hours.nil?
        row 'Saturday hours', class: 'show-working-hours' do
        columns resource.saturday_hours.strftime('%l:%M %P')
        columns resource.saturday_ext_hours.strftime('%l:%M %P')
        end
      end

      unless resource.saturday_hours.nil?
        row 'Sunday hours', class: 'show-working-hours' do
        columns resource.sunday_hours.strftime('%l:%M %P')
        columns resource.sunday_ext_hours.strftime('%l:%M %P')
        end
      end      


      attributes_table :insurances, :member_label => :insurance_name, title: 'insurances'
      attributes_table :doctors ,:title => "Doctors"
      attributes_table :specialities ,:title => "Specialities"
      attributes_table :services ,:title => "Services"
      attributes_table :center_events ,:title => "Events"
      row "Images" do |center|
        ul do
          if center.images.attached?
            center.images.each do |photo|
              li do
                image_tag url_for(photo), width: 100, height: 100
              end
            end
          end
        end
      end

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
