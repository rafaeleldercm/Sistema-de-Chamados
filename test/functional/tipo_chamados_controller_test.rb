require 'test_helper'

class TipoChamadosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_chamados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_chamado" do
    assert_difference('TipoChamado.count') do
      post :create, :tipo_chamado => { }
    end

    assert_redirected_to tipo_chamado_path(assigns(:tipo_chamado))
  end

  test "should show tipo_chamado" do
    get :show, :id => tipo_chamados(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tipo_chamados(:one).to_param
    assert_response :success
  end

  test "should update tipo_chamado" do
    put :update, :id => tipo_chamados(:one).to_param, :tipo_chamado => { }
    assert_redirected_to tipo_chamado_path(assigns(:tipo_chamado))
  end

  test "should destroy tipo_chamado" do
    assert_difference('TipoChamado.count', -1) do
      delete :destroy, :id => tipo_chamados(:one).to_param
    end

    assert_redirected_to tipo_chamados_path
  end
end
