class DoctorInsurance < ApplicationRecord
  belongs_to :doctor
  belongs_to :insurance
end
