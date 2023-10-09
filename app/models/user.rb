class User < ApplicationRecord
  enum status: { admin: 0, teacher: 1, learner: 2, user: 3 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
