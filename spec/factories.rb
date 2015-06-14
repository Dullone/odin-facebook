FactoryGirl.define do  
  
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    sequence :name do |n|
      "person#{n}"
    end
    password "password"
    password_confirmation "password"
  end

  factory :post do 
    sequence :post do |n|
      text "Post of #{n} text here."
    end
  end

  factory :friend_link do 
  end
end