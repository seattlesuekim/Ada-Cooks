require 'spec_helper'

describe CookbooksController do
  describe "GET #index" do 
    it "populates an array of cookbooks" do
      cookbook = Factory(:cookbook)
      get :index
      assigns(:cookbooks).should eq([cookbook])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested cookbook to @cookbook" do
      cookbook = Factory(:cookbook)
      get :show, id: cookbook
      assigns(:cookbook).should eq(cookbook)
    end

    it "renders the :show template" do
      get :show, id: Factory(:cookbook)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Cookbook to @cookbook"
    it "renders the :new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new cookbook in the database"
      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database"
      it "re-renders the :new template"
    end
  end
end