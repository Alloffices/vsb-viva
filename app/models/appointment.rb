class Appointment < ApplicationRecord
	validates :your_name, :email, :phone, :date, :time, :notes, :contacted_via ,presence:true
end
