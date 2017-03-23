class Rent < ApplicationRecord
  belongs_to :customer
  belongs_to :advertisement
end
