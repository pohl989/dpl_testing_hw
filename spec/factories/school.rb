FactoryBot.define do
  factory :school, class: School do
    name {'Test School'}
    address {'123 Elm Street'}
    principal { 'cool guy'}
    capacity {124}
    private_school {true}
  end
end
