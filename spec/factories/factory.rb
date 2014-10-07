FactoryGirl.define do
  factory :user do

    factory :byverdu do
      email 'alby@test.io'
      username 'byverdu'
      password 's3cr3tistooshort'
    end
  end
end