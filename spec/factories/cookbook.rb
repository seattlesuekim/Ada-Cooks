FactoryGirl.define do
  factory :cookbook do |f|
    f.user_id 1
    f.name "Veggie Delights"
    #f.recipe "Carrot Salad"
    #f.ingredient "carrot"
    #f.tool "grater"
  end

  factory :invalid_cookbook, parent: :cookbook do |f|
    f.name nil
  end
end