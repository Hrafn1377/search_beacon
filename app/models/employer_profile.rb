class EmployerProfile < ApplicationRecord
  belongs_to :user

  validates :company_name, presence: true
  validates :domain, format: { with: /\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,}\z/i, message: "must be a valid domain" }, allow_blank: true

  def verified?
    verified && verification_score >= 50
  end

  def trust_level
    case verification_score
    when 0..24 then "unverified"
    when 25..49 then "low"
    when 50..74 then "moderate"
    when 75..100 then "verified"
    end
  end
end