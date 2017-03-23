FactoryGirl.define do
  factory :rent do
    customer
    advertisement
    payment 'Dinheiro'
    rent_date '10 de abril'
  end
end
