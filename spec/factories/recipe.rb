FactoryGirl.define do
  factory :recipe do |f|
    f.name "Carrot Salad"
    f.user_id 1
    f.description "A summer salad with carrots and raisins."
    f.instructions "Mix ingredients together."
    f.vegan false
    f.vegetarian true
    f.GF true
  end
end