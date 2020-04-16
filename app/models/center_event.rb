class CenterEvent < ApplicationRecord
  belongs_to :center
  belongs_to :admin,-> {where(role: User.roles[:SuperAdmin])}, class_name: 'User', foreign_key: 'admin_id'
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  enum approved:[:pending,:approved]
  validates :title, :start_date, :end_date, :start_time, :end_time, :description, :created_by, presence:true
  has_one_attached :image

  validate :start_date_should_be_greater_than_one_month
  validate :end_date_should_be_greater_than_start_date
  validate :start_time_less_than_end_time
  after_create :send_email_to_admin
  scope :pending_event, -> (admin_id) {where(approved: CenterEvent.approveds[:pending], admin_id: admin_id)}


  def start_date_should_be_greater_than_one_month
    if start_date.present?
      unless start_date >= Date.current + 1.month
        errors.add(:start_date, 'must be 1 month greater')
      end
    end
  end

  def end_date_should_be_greater_than_start_date
    if start_date.present? && end_date.present?
      unless end_date > start_date
        errors.add(:end_date, 'must be greater than start date')
      end
    end
  end

  def send_email_to_admin
    admin = User.find_by(id: self.admin_id)
    user = User.find_by(id: self.created_by)
    CenterEventMailer.with(user: user, admin: admin, event: self ).mail_to_admin.deliver_later
  end


  def start_time_less_than_end_time
    if start_time >= end_time
      errors.add(:end_time, 'should be greater than start time')
    end
  end


end
