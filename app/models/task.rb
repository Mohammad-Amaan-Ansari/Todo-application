class Task < ApplicationRecord
  belongs_to :user

  enum priority: { low: 0, high: 1 }
  enum status: { pending: 0, complete: 1 }
  
end
