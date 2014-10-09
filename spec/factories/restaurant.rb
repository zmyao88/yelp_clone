FactoryGirl.define do
  factory :restaurant do

    factory :kfc do
      name        'KFC'
      description 'Fried Chicken'
      cuisine     'Fast Food'
    end
  end
end