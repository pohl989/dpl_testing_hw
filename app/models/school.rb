class School < ApplicationRecord

  has_many :students, dependent: :destroy
  
  validates_presence_of :name, :address, :principal, :capacity, :private_school
  validates_uniqueness_of :name
  validates :capacity, numericality: { only_integer: true }

end