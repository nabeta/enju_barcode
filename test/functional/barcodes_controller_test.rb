require 'test_helper'

class BarcodesControllerTest < ActionController::TestCase
  setup do
    @barcode = barcodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:barcodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create barcode" do
    assert_difference('Barcode.count') do
      post :create, barcode: @barcode.attributes
    end

    assert_redirected_to barcode_path(assigns(:barcode))
  end

  test "should show barcode" do
    get :show, id: @barcode.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @barcode.to_param
    assert_response :success
  end

  test "should update barcode" do
    put :update, id: @barcode.to_param, barcode: @barcode.attributes
    assert_redirected_to barcode_path(assigns(:barcode))
  end

  test "should destroy barcode" do
    assert_difference('Barcode.count', -1) do
      delete :destroy, id: @barcode.to_param
    end

    assert_redirected_to barcodes_path
  end
end
