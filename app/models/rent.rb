class Rent < ApplicationRecord
  belongs_to :customer
  belongs_to :advertisement
  accepts_nested_attributes_for :customer, allow_destroy: true
end
