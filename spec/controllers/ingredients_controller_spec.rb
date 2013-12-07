require 'spec_helper'

describe IngredientsController do
  describe "GET index" do 
    it "populates an array of ingredients" do
      ingredient = FactoryGirl.create(:ingredient)
      get :index
      assigns(:ingredients).should eq([ingredient])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested ingredient to @ingredient" do
      ingredient = FactoryGirl.create(:ingredient)
      get :show, id: ingredient
      assigns(:ingredient).should eq(ingredient)
    end

    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:ingredient)
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
      get :edit, id: FactoryGirl.create(:ingredient)
      response.should render_template :edit
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "saves the new ingredient in the database" do
        expect{
          post :create, ingredient: FactoryGirl.attributes_for(:ingredient)
        }.to change(Ingredient, :count).by(1)
      end
      it "redirects to the list of ingredients" do
        post :create, ingredient: FactoryGirl.attributes_for(:ingredient)
        response.should redirect_to Ingredient.last
      end
    end

    # context "with invalid attributes" do
    #   it "does not save the new ingredient in the database" do
    #     expect{
    #       post :create, ingredient: FactoryGirl.attributes_for(:invalid_ingredient, recipes: [])
    #     }.to_not change(ingredient,:count)
    #   end

    #   it "re-renders the :new template" do
    #     post :create, ingredient: FactoryGirl.attributes_for(:invalid_ingredient, recipes: [])
    #     response.should render_template :new
    #   end
    # end
  end

  describe "PATCH/PUT update" do
    before :each do
      @ingredient = FactoryGirl.create(:ingredient) #This should work 
    end

    context "valid attributes" do 
      it "located the requested @ingredient" do #This should work
        put :update, {id: @ingredient.id, ingredient: FactoryGirl.attributes_for(:ingredient)}
        assigns(:ingredient).should eq @ingredient
      end

      it "changes @ingredient's attributes" do
        put :update, id: @ingredient.id, ingredient: FactoryGirl.attributes_for(:ingredient, name:"Lisa")
        @ingredient.reload
        @ingredient.name.should eq("Lisa")
      end

      it "redirects the updated ingredient" do
        put :update, id: @ingredient.id, ingredient: FactoryGirl.attributes_for(:ingredient)
        response.should redirect_to @ingredient
      end
    end

    # context "invalid attributes" do
    #   it "locates the requested @ingredient" do
    #     put :update, id: @ingredient.id, ingredient: FactoryGirl.attributes_for(:invalid_ingredient, recipes: [])
    #     assigns(:ingredient).should eq(@ingredient)
    #   end

    #   it "does not change @ingredient's attributes" do
    #     put :update, id: @ingredient.id, ingredient: FactoryGirl.attributes_for(:ingredient, ingredient_id: 100, name: nil, recipes: [])
    #     @ingredient.reload
    #     @ingredient.ingredient_id.should_not eq(100)
    #     @ingredient.name.should_not eq(nil)
    #     @ingredient.name.should eq("Veggie Delights")
    #   end

    #   it "re-renders the edit method" do
    #     put :update, id: @ingredient.id, ingredient: FactoryGirl.attributes_for(:invalid_ingredient, recipes: [])
    #     response.should render_template :edit
    #   end
    # end
  end

  describe 'DELETE destroy' do
    before :each do
      @ingredient = FactoryGirl.create(:ingredient)
    end

    it "deletes the ingredient" do
      expect{
        delete :destroy, id: @ingredient.id
      }.to change(Ingredient,:count).by(-1)
    end

    it "redirects to ingredient#index" do
      delete :destroy, id: @ingredient.id
      response.should redirect_to ingredients_url
    end
  end
end