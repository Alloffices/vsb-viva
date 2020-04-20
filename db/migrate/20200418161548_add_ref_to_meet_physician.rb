class AddRefToMeetPhysician < ActiveRecord::Migration[6.0]
  def change
    add_reference :meet_physicians, :center,  foreign_key: true
    add_reference :meet_physicians, :physician_type, foreign_key: true
  end
end
