class CenterEvent < ApplicationRecord
  belongs_to :center
  enum approved:[:pending,:approved]
end
