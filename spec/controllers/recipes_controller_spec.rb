require 'spec_helper'

describe RecipesController do
  describe "GET index" do 
    it "populates an array of recipes" do
      recipe = FactoryGirl.create(:recipe)
      get :index
      assigns(:recipes).should eq([recipe])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET show" do
    it "assigns the requested recipe to @recipe" do
      recipe = FactoryGirl.create(:recipe)
      get :show, id: recipe
      assigns(:recipe).should eq(recipe)
    end

    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:recipe)
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
      get :edit, id: FactoryGirl.create(:recipe)
      response.should render_template :edit
    end
  end

  # describe "POST create" do
  #   context "with valid attributes" do
  #     it "saves the new recipe in the database" do
  #       expect{
  #         post :create, recipe: FactoryGirl.attributes_for(:recipe)
  #       }.to change(Recipe,:count).by(1)
  #     end
  #     it "redirects to the list of recipes" do
  #       post :create, recipe: FactoryGirl.attributes_for(:recipe)
  #       response.should redirect_to Recipe.last
  #     end
  #   end

  #   # context "with invalid attributes" do
  #   #   it "does not save the new recipe in the database" do
  #   #     expect{
  #   #       post :create, recipe: FactoryGirl.attributes_for(:invalid_recipe, recipes: [])
  #   #     }.to_not change(recipe,:count)
  #   #   end

  #   #   it "re-renders the :new template" do
  #   #     post :create, recipe: FactoryGirl.attributes_for(:invalid_recipe, recipes: [])
  #   #     response.should render_template :new
  #   #   end
  #   # end
  # end

  # describe "PATCH/PUT update" do
  #   before :each do
  #     @recipe = FactoryGirl.create(:recipe) #This should work 
  #   end

  #   context "valid attributes" do 
  #     it "located the requested @recipe" do #This should work
  #       put :update, {id: @recipe.id, recipe: FactoryGirl.attributes_for(:recipe)}
  #       assigns(:recipe).should eq @recipe
  #     end

  #     it "changes @recipe's attributes" do
  #       put :update, id: @recipe.id, recipe: FactoryGirl.attributes_for(:recipe, name:"Lisa")
  #       @recipe.reload
  #       @recipe.name.should eq("Lisa")
  #     end

  #     it "redirects the updated recipe" do
  #       put :update, id: @recipe.id, recipe: FactoryGirl.attributes_for(:recipe)
  #       response.should redirect_to @recipe
  #     end
  #   end

  #   # context "invalid attributes" do
  #   #   it "locates the requested @recipe" do
  #   #     put :update, id: @recipe.id, recipe: FactoryGirl.attributes_for(:invalid_recipe, recipes: [])
  #   #     assigns(:recipe).should eq(@recipe)
  #   #   end

  #   #   it "does not change @recipe's attributes" do
  #   #     put :update, id: @recipe.id, recipe: FactoryGirl.attributes_for(:recipe, recipe_id: 100, name: nil, recipes: [])
  #   #     @recipe.reload
  #   #     @recipe.recipe_id.should_not eq(100)
  #   #     @recipe.name.should_not eq(nil)
  #   #     @recipe.name.should eq("Veggie Delights")
  #   #   end

  #   #   it "re-renders the edit method" do
  #   #     put :update, id: @recipe.id, recipe: FactoryGirl.attributes_for(:invalid_recipe, recipes: [])
  #   #     response.should render_template :edit
  #   #   end
  #   # end
  # end

  describe 'DELETE destroy' do
    before :each do
      @recipe = FactoryGirl.create(:recipe)
    end

    it "deletes the recipe" do
      expect{
        delete :destroy, id: @recipe.id
      }.to change(Recipe,:count).by(-1)
    end

    it "redirects to recipe#index" do
      delete :destroy, id: @recipe.id
      response.should redirect_to recipes_url
    end
  end
end