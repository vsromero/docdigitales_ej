class Sucursal < ApplicationRecord
  belongs_to :usuario
  has_many :empleados

  validates_uniqueness_of :nombre
end
