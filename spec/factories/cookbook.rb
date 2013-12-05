FactoryGirl.define do
  factory :cookbook do |f|
    f.name "Veggie Delights"
    f.user_id 1
    f.recipe "Carrot Salad"
    f.ingredient "carrot"
    f.tool "grater"
  end
end