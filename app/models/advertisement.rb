class Advertisement < ApplicationRecord
  has_one :bike
  has_many :rents
end
