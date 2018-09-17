require 'rails_helper'

RSpec.describe Student, type: :model do

  it "has a valid factory" do
    # Using the shortened version of FactoryGirl syntax.
    # Add:  "config.include FactoryGirl::Syntax::Methods" (no quotes) to your spec_helper.rb
    expect(build(:student)).to be_valid
  end

  # write your student model here
  describe 'attributes' do
    it { should respond_to :name } 
    it { should respond_to :student_number } 
    it { should respond_to :gpa } 
  end 

  describe "association" do
    it { should belong_to(:school) }
  end

  describe "uniqueness" do
    it { expect(build(:student)).to validate_uniqueness_of(:name) }
  end

  #VALIDATE BELOW
  describe "numericality" do
    it { expect(build(:student)).to validate_numericality_of(:student_number).is_less_than_or_equal_to(10000) }
    it { expect(build(:student)).to validate_numericality_of(:student_number).is_greater_than_or_equal_to( 0) }
  end 
end 