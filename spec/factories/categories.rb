FactoryGirl.define do
  factory :category do
    title "Category title"

    factory :category_with_lists do
      transient do
        lists_count 5
      end

      after(:create) do |category, evaluator|
        create_list(:list, evaluator.lists_count, category: category)
      end
    end
  end
end
