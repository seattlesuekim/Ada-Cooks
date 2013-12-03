require 'test_helper'

class CookbooksControllerTest < ActionController::TestCase
  setup do
    @cookbook = cookbooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cookbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cookbook" do
    assert_difference('Cookbook.count') do
      post :create, cookbook: { name: @cookbook.name, user_id: @cookbook.user_id }
    end

    assert_redirected_to cookbook_path(assigns(:cookbook))
  end

  test "should show cookbook" do
    get :show, id: @cookbook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cookbook
    assert_response :success
  end

  test "should update cookbook" do
    patch :update, id: @cookbook, cookbook: { name: @cookbook.name, user_id: @cookbook.user_id }
    assert_redirected_to cookbook_path(assigns(:cookbook))
  end

  test "should destroy cookbook" do
    assert_difference('Cookbook.count', -1) do
      delete :destroy, id: @cookbook
    end

    assert_redirected_to cookbooks_path
  end
end
