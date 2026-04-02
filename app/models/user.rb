class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :jobs, dependent: :destroy
  has_one :employer_profile, dependent: :destroy
  has_one :seeker_profile, dependent: :destroy

  scope :employers, -> { where(role: "employer") }
  scope :seekers, -> { where(role: "seeker") }

  ROLES = %w[seeker employer].freeze

  validates :role, inclusion: { in: ROLES }

  def seeker?
    role == "seeker"
  end

  def employer?
    role == "employer"
  end
end