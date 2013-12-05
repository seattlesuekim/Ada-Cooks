require 'spec_helper'

describe CookbooksController do
  describe "GET index" do 
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

  describe "GET show" do
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

  describe "GET new" do
    # it "assigns a new Cookbook to @cookbook" do
    #   get :new
    # end

    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "GET edit" do
    it "renders the :edit template" do
      get :edit
      response.should render_template :edit
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "saves the new cookbook in the database" do
        expect{
          post :create, cookbook: Factory.attributes_for(:cookbook)
        }.to change(Cookbook,:count).by(1)
      end
      it "redirects to the list of cookbooks" do
        post :create, cookbook: Factory.attributes_for(:cookbook)
        response.should redirect_to Cookbook.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new cookbook in the database" do
        expect{
          post :create, cookbook: Factory.attributes_for(:invalid_cookbook)
        }.to_not change(Cookbook,:count)
      end

      it "re-renders the :new template" do
        post :create, cookbook: Factory.attributes_for(:invalid_cookbook)
        response.should render_template :new
      end
    end
  end

  describe "PATCH/PUT update" do
    before :each do
      @cookbook = Factory(:cookbook.attributes_for(:cookbook))
    end

    context "valid attributes" do
      it "located the requested @cookbook" do
        put :update, id: @cookbook, cookbook: Factory.attributes_for(:cookbook)
        assigns(:cookbook).should eq @cookbook
      end

      it "changes @cookbook's attributes" do
        put :update, id:@cookbook, cookbook:Factory.attributes_for(:cookbook, user_id: 2, name: "Carnivorous")
        @cookbook.reload
        @cookbook.user_id.should eq(2)
        @cookbooks.name.should eq("Carnivorous")
      end

      it "redirects the updated cookbook" do
        put :update, id: @cookbook, cookbook: Factory.attributes_for(:cookbook)
        response.should redirect_to @cookbook
      end
    end

    context "invalid attributes" do
      it "locates the requested @cookbook" do
        put :update, id: @cookbook, cookbook: Factory.attributes_for(:invalid_cookbook)
        assigns(:cookbook).should eq(@cookbook)
      end

      it "does not change @cookbook's attributes" do
        put :update, id: @cookbook, cookbook: Factory.attributes_for(:cookbook, user_id: 100, name: nil)
        @cookbook.reload
        @cookbook.user_id.should_not eq(100)
        @cookbook.name.should_not eq(nil)
        @cookbook.name.should eq("Veggie Delights")
      end

      it "re-renders the edit method" do
        put :update, id: @cookbook, cookbook: Factory.attributes_for(:invalid_cookbook)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @cookbook = Factory(:cookbook)
    end

    it "deletes the cookbook" do
      expect{
        delete :destroy, id: @cookbook
      }.to change(Cookbook,:count).by(-1)
    end

    it "redirects to cookbook#index" do
      delete :destroy, id: @cookbook
      response.should redirect_to cookbooks_url
    end

  end
end