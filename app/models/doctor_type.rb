class DoctorType < ApplicationRecord
  belongs_to :doctor
  belongs_to :physician_type
end
