namespace :admin do
  desc "TODO"
  task send_email_for_events: :environment do
    admins = User.where(role: 'SuperAdmin')
    admins.each do |admin|
      events = admin.admin_center_events.where('Date(start_date) between ? and ?',
                                 Date.current.beginning_of_month,
                                 Date.current.end_of_month)
                 .where(approved: CenterEvent.approveds[:pending])
      if events.present?
        CenterEventMailer.with(admin: admin, events: events).remind_to_admin.deliver_now
      end
    end
  end
end
