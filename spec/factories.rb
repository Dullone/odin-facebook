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
    text "Post of text here."
  end
  factory :friend_link do 
  end
end