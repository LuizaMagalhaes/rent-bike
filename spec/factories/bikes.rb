FactoryGirl.define do
  factory :bike do
    color 'preta'
    weel_size '26'
    condition 'Nova'
    category 'Adulto'
    use_for 'Trilha'
    photo_url 'http://www.caloi.com/userfiles/bikes/fotos/t1_arquivo_20150611145843.jpg'
  end
end
