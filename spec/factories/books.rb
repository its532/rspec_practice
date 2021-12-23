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

  def take_pictures
    raise RuntimeError.new("写真撮影はご遠慮ください")
  end
end
