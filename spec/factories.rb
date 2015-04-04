FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person#{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end

  factory :article do
    url "http://www.animenewsnetwork.com/shelf-life/2015-03-30/.86540"
    content "content content content sample sample"
    title "sample_title"
    user
  end
end

