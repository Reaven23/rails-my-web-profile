class Call < ApplicationRecord
  belongs_to :user
  belongs_to :appointment
end
