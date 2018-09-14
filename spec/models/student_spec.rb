require 'rails_helper'

RSpec.describe Student, type: :model do
  # write your student model here
  describe 'attributes' do
    it { should respond_to :name } 
    it { should respond_to :student_number } 
    it { should respond_to :gpa } 
  end 

  describe "association" do
    it { should belong_to(:school) }
  end

  # describe "uniqueness" do
  #   school = School.create!(name: 'foo', address: '123', principal: 'mt')
  #   school.students.create!(school_id: School.first, name: 'foo', student_number: 123, gpa: 3.45)
  #   subject { school.students..new(school_id: School.first, name: 'foo', student_number: 13, gpa: 3.46) }
  #   it { should validate_uniqueness_of(:name) }
  # end

  #VALIDATE BELOW
  # validates :student_number, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000}


end 