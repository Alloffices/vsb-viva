class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :admin_center_events, class_name: 'CenterEvent', foreign_key: 'admin_id'
  has_many :created_center_events, class_name: 'CenterEvent', foreign_key: 'created_by_id'
  enum role:[:Manager,:SuperAdmin, :event_admin, :event_creator]
  validates :email , :first_name,:last_name,:role ,presence:true
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  after_create :send_welcome_email



  def super_admin?
    self.role == 'SuperAdmin'
  end

  def manager?
    self.role == 'Manager'
  end

  def send_welcome_email
    UserMailer.with(user: self ).welcome_email.deliver_later
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
