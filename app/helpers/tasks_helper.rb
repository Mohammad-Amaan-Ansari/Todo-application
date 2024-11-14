# frozen_string_literal: true

# app/helpers/tasks_helper.rb
module TasksHelper
  def priority_badge_class(priority)
    case priority
    when 'high'
      'badge-danger'
    when 'medium'
      'badge-warning'
    when 'low'
      'badge-primary'
    else
      'badge-secondary'
    end
  end

  def status_badge_class(status)
    case status
    when 'complete'
      'badge-success'
    when 'in_progress'
      'badge-warning'
    when 'pending'
      'badge-danger'
    else
      'badge-secondary'
    end
  end
end
