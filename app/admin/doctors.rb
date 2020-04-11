ActiveAdmin.register Doctor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :language,:education,:avatar,
                 :certifications, :biography, :video_id, :image, doctor_category_ids: [],
                 physician_type_ids: [] , center_ids:[]

    form do |f|
      f.semantic_errors *f.object.errors.keys

      f.inputs "Doctor" do
        f.input :name
        f.input :language
        f.input :education
        f.input :certifications
        f.input :biography
        f.input :doctor_categories , as: :select, :input_html => {class: 'multiselect'}
        f.input :video_id, as: :file
        if doctor.video.attached?
          li class: 'Video' do
            video_tag(url_for(doctor.video), width: 200, height: 200, controls: 'controls')
          end
        end
        f.input :physician_types, as: :select, :input_html => {class: 'multiselect'}
        f.input :centers , as: :select, :input_html => {class: 'multiselect'}
        f.input :image, as: :file
        if doctor.image.attached?
          li class: 'show-image' do
            image_tag url_for(doctor.image), width: 100, height: 100
          end
        end
      end
      f.actions
    end

    show do
      attributes_table do
        row :name
        row :language
        row :education
        row :certifications
        row :biography
        row :doctor_categories

        row :video do |doctor|
          video_tag(url_for(doctor.video_id), width: 400, height: 400, controls: 'controls') if doctor.video.attached?
        end
        row :image do |ad|
          if ad.image.attached?
            image_tag url_for(ad.image),width: 100, height: 100
          else
            image_tag url_for(ad.avatar),width: 100, height: 100
          end   
        end
        row :physician_types
        row :centers
      end
    end

   index do
     column :id
     column :name
     column :language
     column :education
     column :certifications
     column :biography
     column :doctor_category
     column :created_at
     column :updated_at
     actions
   end


  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :language, :education, :certifications, :biography, :video, :headshot_yext, :headshot_source]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
