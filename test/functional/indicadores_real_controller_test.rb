require 'test_helper'

class IndicadoresRealControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicadores_real)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicador_real" do
    assert_difference('IndicadorReal.count') do
      post :create, :indicador_real => { }
    end

    assert_redirected_to indicador_real_path(assigns(:indicador_real))
  end

  test "should show indicador_real" do
    get :show, :id => indicadores_real(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => indicadores_real(:one).to_param
    assert_response :success
  end

  test "should update indicador_real" do
    put :update, :id => indicadores_real(:one).to_param, :indicador_real => { }
    assert_redirected_to indicador_real_path(assigns(:indicador_real))
  end

  test "should destroy indicador_real" do
    assert_difference('IndicadorReal.count', -1) do
      delete :destroy, :id => indicadores_real(:one).to_param
    end

    assert_redirected_to indicadores_real_path
  end
end
