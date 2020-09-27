class Sucursal < ApplicationRecord
  belongs_to :usuario
  has_many :empleados, dependent: :destroy

  #validates_uniqueness_of :nombre
end
