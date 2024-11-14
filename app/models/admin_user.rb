# frozen_string_literal: true

# app/models/admin_user.rb
class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(_auth_object = nil)
    # List the attributes that you want to make searchable
    %w[email created_at updated_at]
  end
end
