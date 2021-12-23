FactoryBot.define do
  factory :book do
    title { "RubyBook" }
    author { "its" }
  end

  trait :with_variations do
    after(:create) do |book|
      book.variations.create!(kind: "paper book")
    end
  end
end
