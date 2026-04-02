class Job < ApplicationRecord
  belongs_to :user

  EXPERIENCE_LEVELS = %w[entry mid senior lead].freeze
  STATUSES = %w[pending active rejected expired].freeze
  WORK_AUTH = %w[any citizens_only visa_sponsored].freeze

  validates :title, presence: true
  validates :company, presence: true
  validates :description, presence: true
  validates :experience_level, inclusion: { in: EXPERIENCE_LEVELS }
  validates :status, inclusion: { in: STATUSES }
  validates :work_authorization, inclusion: { in: WORK_AUTH }

  scope :active, -> { where(status: "active" ) }
  scope :pending, -> { where(status: "pending" ) }
  scope :not_expired, -> { where("expires_at > ?", Time.current).or(where(expires_at: nil)) }

  def verified?
    verified_at.present?
  end

  def suspicious?
    fraud_score >= 10
  end
end