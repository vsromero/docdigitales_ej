require 'test_helper'

class SucursalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sucursal = sucursales(:one)
  end

  test "should get index" do
    get sucursales_url
    assert_response :success
  end

  test "should get new" do
    get new_sucursal_url
    assert_response :success
  end

  test "should create sucursal" do
    assert_difference('Sucursal.count') do
      post sucursales_url, params: { sucursal: { calle: @sucursal.calle, ciudad: @sucursal.ciudad, codigo_postal: @sucursal.codigo_postal, colonia: @sucursal.colonia, nombre: @sucursal.nombre, numero_exterior: @sucursal.numero_exterior, numero_interior: @sucursal.numero_interior, pais: @sucursal.pais, usuario_id: @sucursal.usuario_id } }
    end

    assert_redirected_to sucursal_url(Sucursal.last)
  end

  test "should show sucursal" do
    get sucursal_url(@sucursal)
    assert_response :success
  end

  test "should get edit" do
    get edit_sucursal_url(@sucursal)
    assert_response :success
  end

  test "should update sucursal" do
    patch sucursal_url(@sucursal), params: { sucursal: { calle: @sucursal.calle, ciudad: @sucursal.ciudad, codigo_postal: @sucursal.codigo_postal, colonia: @sucursal.colonia, nombre: @sucursal.nombre, numero_exterior: @sucursal.numero_exterior, numero_interior: @sucursal.numero_interior, pais: @sucursal.pais, usuario_id: @sucursal.usuario_id } }
    assert_redirected_to sucursal_url(@sucursal)
  end

  test "should destroy sucursal" do
    assert_difference('Sucursal.count', -1) do
      delete sucursal_url(@sucursal)
    end

    assert_redirected_to sucursales_url
  end
end
