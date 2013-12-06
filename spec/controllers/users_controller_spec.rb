# Not yet functioning

require 'spec_helper'

describe UsersController do
  describe "GET index" do 
    it "populates an array of users" do
      user = FactoryGirl.create(:user)
      get :index
      assigns(:users).should eq([user])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested user to @user" do
      user = FactoryGirl.create(:user)
      get :show, id: user
      assigns(:user).should eq(user)
    end

    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:user)
      response.should render_template :show
    end
  end

  describe "GET new" do

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "GET edit" do
    it "renders the :edit template" do
      get :edit, id: FactoryGirl.create(:user)
      response.should render_template :edit
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "saves the new user in the database" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end
      it "redirects to the list of users" do
        post :create, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to User.last
      end
    end

    # context "with invalid attributes" do
    #   it "does not save the new user in the database" do
    #     expect{
    #       post :create, user: FactoryGirl.attributes_for(:invalid_user, recipes: [])
    #     }.to_not change(user,:count)
    #   end

    #   it "re-renders the :new template" do
    #     post :create, user: FactoryGirl.attributes_for(:invalid_user, recipes: [])
    #     response.should render_template :new
    #   end
    # end
  end

  describe "PATCH/PUT update" do
    before :each do
      @user = FactoryGirl.create(:user) #This should work 
    end

    context "valid attributes" do 
      it "located the requested @user" do #This should work
        put :update, {id: @user.id, user: FactoryGirl.attributes_for(:user)}
        assigns(:user).should eq @user
      end

      it "changes @user's attributes" do
        put :update, id: @user.id, user: FactoryGirl.attributes_for(:user, name:"Lisa")
        @user.reload
        @user.name.should eq("Lisa")
      end

      it "redirects the updated user" do
        put :update, id: @user.id, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to @user
      end
    end

    # context "invalid attributes" do
    #   it "locates the requested @user" do
    #     put :update, id: @user.id, user: FactoryGirl.attributes_for(:invalid_user, recipes: [])
    #     assigns(:user).should eq(@user)
    #   end

    #   it "does not change @user's attributes" do
    #     put :update, id: @user.id, user: FactoryGirl.attributes_for(:user, user_id: 100, name: nil, recipes: [])
    #     @user.reload
    #     @user.user_id.should_not eq(100)
    #     @user.name.should_not eq(nil)
    #     @user.name.should eq("Veggie Delights")
    #   end

    #   it "re-renders the edit method" do
    #     put :update, id: @user.id, user: FactoryGirl.attributes_for(:invalid_user, recipes: [])
    #     response.should render_template :edit
    #   end
    # end
  end

  describe 'DELETE destroy' do
    before :each do
      @user = FactoryGirl.create(:user)
    end

    it "deletes the user" do
      expect{
        delete :destroy, id: @user.id
      }.to change(User,:count).by(-1)
    end

    it "redirects to user#index" do
      delete :destroy, id: @user.id
      response.should redirect_to users_url
    end
  end
end