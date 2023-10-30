class Lesson < ApplicationRecord
  has_many :appointments

  def initialize(title, type, duration, cost)
    @title = title
    @type = type
    @duration = duration
    @cost = cost
  end
end
