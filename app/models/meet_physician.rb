class MeetPhysician < ApplicationRecord
	belongs_to :center , optional: true
	belongs_to :physician_type , optional: true
end
