class SeekerProfile < ApplicationRecord
  belongs_to :user

  EXPERIENCE_LEVELS = %w[entry mid senior lead].freeze
  WORK_AUTH = %w[any citizen visa_required].freeze

  validates :experience_level, inclusion: { in: EXPERIENCE_LEVELS }, allow_blank: true
  validates :work_authorization, inclusion { in: WORK_AUTH }

  def salary_range
    return "Not specified" unless salary_min || salary_max
    return "Up to ${salary_max.to_s(:delimited)}" unless salary_min
    return "From ${salary_min.to_s(:delimited)}" unless salary_max
    "$#{salary_min.to_s(:delmited)} - $#{salary_max.to_s(:delimited)}"
  end  
end
