FactoryGirl.define do
  factory :rent do
    customer
    advertisement
    payment 'Dinheiro'
    rent_date '10 de abril'
    price 15.9
  end
end
