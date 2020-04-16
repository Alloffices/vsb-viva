ActiveAdmin.register CenterEvent do
  scope :all, default: true
  scope :my_pending_event do |events|
    events.pending_event(current_user.id)
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  config.sort_order = 'id_asc'
   permit_params :center_id, :title, :approved, :start_date, :end_date,
                 :description, :admin_id, :created_by_id, :start_time, :end_time
  #
  # or
  #
  # permit_params do
  #   permitted = [:center_id, :title, :approved, :start_date, :end_date, :description, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  member_action :approve, method: :put do
    resource.approved = 'approved'
    resource.save(validate: false)
    redirect_to resource_path, notice: "Locked!"
  end

  batch_action :approve_selected,
               if: proc { request.params['scope'] == 'my_pending_event' && current_user.role == 'SuperAdmin' } do |events_id|
    events_id.each do |event_id|
      event = CenterEvent.find(event_id)
      event.approved = 'approved'
      event.save(validate: false)
    end
    redirect_to admin_center_events_path(scope: 'my_pending_event')
  end


  form do |f|
      f.semantic_errors *f.object.errors.keys

      f.inputs "Center Event" do
        f.input :center
        f.input :created_by_id, as: :hidden, :input_html => { value: current_user.id}
        f.input :admin, as: :select, collection: User.where(role: User.roles[:SuperAdmin])
                                                   .map{ |user| [user.full_name, user.id]}
        f.input :title
        columns class: 'working-hours' do
          columns class: 'hours' do
            columns class: 'width-30' do
              f.input :start_time
            end

            columns class: 'width-30' do
              f.input :end_time
            end
          end

        end
        if current_user.role != "Manager"
          f.input :approved
        end
        f.input :start_date, as: :datepicker, :input_html => { :value => (Date.current + 1.month)}
        f.input :end_date, as: :datepicker, :input_html => { :value => (Date.current + 1.month) + 1.day}
        f.input :description
      end
      f.actions
   end

   index do
     selectable_column
     column :center
     column :title
     column :approved
     column :start_date
     column :start_time do |center_event|
       columns center_event.start_time&.strftime('%l:%M %P')
     end
     column :end_time do |center_event|
       columns center_event.end_time&.strftime('%l:%M %P')
     end
     column :end_date
     column :description
     column :created_at
     column :updated_at
     actions defaults: true do |event|
       if request.params['scope'] == 'my_pending_event' ||
         (current_user.role == 'SuperAdmin' && event.pending? && current_user.unable_to_destroy)
         link_to 'Approve', approve_admin_center_event_path(event), method: :put
       end
     end
   end

   show do
      attributes_table do
        row :center
        row :title
        row :approved
        row :start_date
        row :start_time do
          columns resource.start_time.strftime('%l:%M %P')
        end
        row :end_time do
          columns resource.end_time.strftime('%l:%M %P')
        end
        row :end_date
        row :description
      end
   end
end
