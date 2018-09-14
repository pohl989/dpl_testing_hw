FactoryBot.define do
  factory :student, class: Student do
    name {'Toyota Sam'}
    student_number {103}
    gpa {3.4}
    school
  end
end

