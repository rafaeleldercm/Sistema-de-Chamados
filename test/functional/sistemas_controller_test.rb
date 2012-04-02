require 'test_helper'

class SistemasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sistemas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sistemas" do
    assert_difference('Sistemas.count') do
      post :create, :sistemas => { }
    end

    assert_redirected_to sistemas_path(assigns(:sistemas))
  end

  test "should show sistemas" do
    get :show, :id => sistemas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sistemas(:one).to_param
    assert_response :success
  end

  test "should update sistemas" do
    put :update, :id => sistemas(:one).to_param, :sistemas => { }
    assert_redirected_to sistemas_path(assigns(:sistemas))
  end

  test "should destroy sistemas" do
    assert_difference('Sistemas.count', -1) do
      delete :destroy, :id => sistemas(:one).to_param
    end

    assert_redirected_to sistemas_path
  end
end
