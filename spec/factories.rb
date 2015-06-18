FactoryGirl.define do 

  factory :comment do
    user nil
    post nil

    text "MyText"
  end
  

  factory :like do  
  end


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
    sequence :text do |n|
      "Post of #{n} text here."
    end
  end

  factory :friend_link do 
  end
end