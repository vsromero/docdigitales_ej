class Usuario < ApplicationRecord
  has_secure_password
  has_many :sucursales, dependent: :destroy

  #validates_uniqueness_of :email
  #validates_uniqueness_of :RFC
end
