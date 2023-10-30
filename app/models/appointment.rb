class Appointment < ApplicationRecord
  belongs_to :lesson
  belongs_to :user

  def initialize(date, time, user_id, lesson_id)
    @date = date
    @time = time
    @user_id = user_id
    @lesson_id = lesson_id
  end
end
