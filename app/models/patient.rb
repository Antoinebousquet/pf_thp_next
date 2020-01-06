class Patient < ApplicationRecord
	after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :appointments, dependent: :delete_all #This line enable to create a seed without problem
  has_many :practionners, through: :appointments

  has_many :data_shows, dependent: :delete_all
  has_many :days, through: :data_shows

  has_one_attached :avatar

  def welcome_send
    PatientMailer.welcome_email(self).deliver_now
  end

end

