class CategoryDocotr < ApplicationRecord
  belongs_to :doctor
  belongs_to :doctor_category
end
