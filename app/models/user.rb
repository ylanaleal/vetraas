class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable,:registerable, :recoverable
  devise :database_authenticatable, :rememberable, :validatable
end
