class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :region
  has_many :centers
  enum role:[:Manager,:SuperAdmin]
  validates :email , :first_name,:last_name,:role ,presence:true
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
end
