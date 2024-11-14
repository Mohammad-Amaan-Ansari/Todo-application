class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  enum role: { user: 0, admin: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  def user?
    role == 'user'
  end

  def admin?
    role == 'admin'
  end
end


