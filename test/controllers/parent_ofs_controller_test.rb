require 'test_helper'

class ParentOfsControllerTest < ActionController::TestCase
  setup do
    @parent_of = parent_ofs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parent_ofs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent_of" do
    assert_difference('ParentOf.count') do
      post :create, parent_of: {  }
    end

    assert_redirected_to parent_of_path(assigns(:parent_of))
  end

  test "should show parent_of" do
    get :show, id: @parent_of
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parent_of
    assert_response :success
  end

  test "should update parent_of" do
    patch :update, id: @parent_of, parent_of: {  }
    assert_redirected_to parent_of_path(assigns(:parent_of))
  end

  test "should destroy parent_of" do
    assert_difference('ParentOf.count', -1) do
      delete :destroy, id: @parent_of
    end

    assert_redirected_to parent_ofs_path
  end
end
