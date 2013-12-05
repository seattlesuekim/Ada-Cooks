FactoryGirl.define do
  factory :ingredient do |f|
    f.name "carrot"
    f.user_id 1
    f.qty "4 cups"
  end
end