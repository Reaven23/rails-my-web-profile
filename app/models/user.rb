class User < ApplicationRecord
  enum role: [:user, :admin, :teacher, :learner]

  def set_default_role
    self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
