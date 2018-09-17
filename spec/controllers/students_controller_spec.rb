require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  # Write your test below
  # it will be easier to test this controller with factory bot
    # you would have to add the gem and configure it.

    before(:each) do
      @school = create(:school)
      @student = create(:student, :school => @school, :name => "Joe")
    end
    let(:valid_attributes) {
      {
        school_id: School.last.id,
        name: "This is my name", 
        student_number: 4,
        gpa: 2.4,
      }
    }
  
    let(:invalid_attributes) {
      {
        school_id: School.last.id,
        name: "Testy", 
        student_number: 780000,
        gpa: 2.4,
      }
    }

    describe "GET #index" do
      it "returns http success" do
        get :index, params: { school_id: @student.school_id }
        expect(response).to be_successful
      end
    end

    describe "GET #show" do 
      it "returns http success" do 
        get :show, params: { id: @student.id, school_id: @student.school_id}
        expect(response).to be_successful
      end 
    end 

    describe "Get #new" do 
      it "returns http success" do 
        get :new, params: {school_id: @school.id}
        expect(response).to be_successful
      end 
    end 

    describe "GET #EDIT" do 
      it "reutnrs http success" do 
        get :edit, params: {school_id: @student.school_id, id: @student.id}
        expect(response).to be_successful
      end 
    end

    describe "POST #create" do 
      context "creates with valid params" do 
        it "creates a new student" do 
          expect {
          post :create, params: { student: valid_attributes}
          }.to change(Student, :count).by(1)
        end
  
        it "redirects to the created student" do
          post :create, params: { student: valid_attributes }
          expect(response).to redirect_to(Student.last)
        end
      end

      context 'creates with invalid params' do
        it 'creates a student' do
          expect {
            post :create, params: { student: invalid_attributes }
          }.to change(Student, :count).by(0)
        end
  
        it 'redirect back to form' do
          post :create, params: { student: invalid_attributes }
          expect(response).to be_successful
        end
      end
    end 

    describe "DELETE #destroy" do
      it "destroy the student" do
        expect {
          delete :destroy, params: {id: @student.id, school_id: @student.school_id }
        }.to change(Student, :count).by(-1)
      end
  
      it "redirect to all the bank accounts" do
        delete :destroy, params: { id: @student.id, school_id: @student.school_id }
        expect(response).to redirect_to(school_students_url(@school))
      end
    end  

    describe "PUT #update" do
      context "with valid params" do
        let(:new_attr) {
          { gpa: 4.0 }
        }
  
        it "updates the student" do
          put :update, params: { school_id: @student.school_id, student: {id: @student.id, gpa: 4.0 }}
          @student.reload
          expect(@student.gpa).to eq(new_attr[:gpa])
        end
  
        it "redirect to the student" do
          put :update, params: { school_id: @student.school_id, student: {id: @student.id, gpa: 4.0 }}
          expect(response).to redirect_to(school_student_path(@student.school, @student))
        end
      end
  
      context "with invalid params" do
        it "does not update" do
          put :update, params: { student: {id: @student.id, school_id: @student.school_id, student_number: 180023 }}
          @student.reload
          expect(@student.student_number).to_not eq(invalid_attributes[:student_number])
        end
  
        it "render out the form" do 
          put :update, params: { student: {id: @student.id, school_id: @student.school_id, student_number: 180023 }}
          expect(response).to be_successful
        end
      end
    end


end


