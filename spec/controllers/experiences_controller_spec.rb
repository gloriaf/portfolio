require 'spec_helper'

describe ExperiencesController do
  subject { page }

  describe "experiences#index - GET index" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
    it "populates an array of experiences" do
      @experiences = FactoryGirl.create(:experience, user: @user)
      get :index, user_id: @user.id
      response.should be_success
      assigns(:experiences).should eq([@experiences])
    end
    it "should rendes the :index view" do
      get :index, user_id: @user.id
      response.should render_template :index
    end
  end

  describe "experience#show - GET show" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @experience = FactoryGirl.create(:experience, user: @user)
    end
    it "should assigns the requested experience to @experience" do
      get :show, user_id: @user.id, id: @experience.id
      assigns(:experience).should eq(@experience) 
    end
  end

  describe "experience#edit" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @experience = FactoryGirl.create(:experience, user: @user)
    end
    it "located the requested @experience" do
      put :edit, user_id: @user.id, id: @experience.id, experience: FactoryGirl.attributes_for(:experience)
      assigns(:experience).should eq(@experience)
    end
  end
  
  describe "experience#new GET new" do
    before do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @experience  = Experience.new
    end
    
    it "should create a new object" do
      get :new, user_id: @user.id
      assigns(:experience).should_not be_nil  
    end
  end
  
  describe "experience#create - POST create" do
    
    context "whit valid attributes" do
      before :each do
        @user = FactoryGirl.create(:user)
        sign_in @user
        @experience_attributes =  FactoryGirl.attributes_for(:experience)
      end
      it "should create a new experience for a user" do
        expect {
          post :create, user_id: @user.id, experience: @experience_attributes
        }.to change(Experience, :count).by(1)
      end
      it "should assigns correct values" do
        post :create, user_id: @user.id, experience: @experience_attributes
        assigns(:experience).should be_a(Experience)
      end
      it "should redirect to the show note user page"  do
        post :create, user_id: @user.id, experience: @experience_attributes
        response.should redirect_to(user_experiences_path(@user))
      end
    end
    
    context "with invalid attributes" do
      before :each do
        @user = FactoryGirl.create(:user)
        sign_in @user
        @experience_attributes =  FactoryGirl.attributes_for(:experience, name: nil)
      end
      
      it "does not save the new experience" do
        expect{
        post :create, user_id: @user.id, experience: @experience_attributes
        }.to_not change(Experience,:count)
      end
      it "re-renders the new method" do
        post :create, user_id: @user.id, experience: @experience_attributes
        response.should render_template :new
      end
    end 
  end

  describe "experience#edit - PUT update" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @experience = FactoryGirl.create(:experience, user: @user)
    end
    
    context "valid attributes" do
      it "located the requested @experience" do
        put :update, user_id: @user.id, id: @experience.id, experience: FactoryGirl.attributes_for(:experience)
        assigns(:experience).should eq(@experience)
      end
      it "changes @user's attributes" do
        put :update, user_id: @user.id, id: @experience.id, experience: FactoryGirl.attributes_for(:experience, name: "Update the experience")
        @experience.reload
        @experience.name.should eq("Update the experience")
      end
      it "redirects to show" do
        put :update, user_id: @user.id, id: @experience.id, experience: FactoryGirl.attributes_for(:experience)
        response.should redirect_to(user_experience_path(@user,@experience))
      end
    end
    
    context "invalid attributes" do
      before :each do
        @name=@experience.name
        put :update, user_id: @user.id, id: @experience.id, experience: FactoryGirl.attributes_for(:experience, name: "")
      end
      
      it "does not change @experience's attributes" do
        @experience.reload
        @experience.name.should eq(@name)
      end
      it "re-renders the edit method" do
        response.should render_template :edit
      end
    end
  end

  describe "experience#delete - DELETE destroy" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @experience  = FactoryGirl.create(:experience, user: @user)
    end
    
    it "should delete the experience" do
      expect{ 
        delete :destroy, user_id: @user.id, id: @experience.id
      }.to change(Experience, :count).by(-1)
    end
    it "shoud redirects to experience#index" do
      delete :destroy, user_id: @user.id, id: @experience.id
      response.should redirect_to(user_experiences_path(@user))
    end
  end
  
  describe "experience#summary_by_email" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in @user
      @experience  = FactoryGirl.create(:experience, user: @user)
    end
    it "should send an email" do
      
    end

  end
end
