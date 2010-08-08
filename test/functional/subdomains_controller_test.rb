require 'test_helper'

class SubdomainsControllerTest < ActionController::TestCase
  setup do
    @subdomain = subdomains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subdomains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subdomain" do
    assert_difference('Subdomain.count') do
      post :create, :subdomain => @subdomain.attributes
    end

    assert_redirected_to subdomain_path(assigns(:subdomain))
  end

  test "should show subdomain" do
    get :show, :id => @subdomain.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @subdomain.to_param
    assert_response :success
  end

  test "should update subdomain" do
    put :update, :id => @subdomain.to_param, :subdomain => @subdomain.attributes
    assert_redirected_to subdomain_path(assigns(:subdomain))
  end

  test "should destroy subdomain" do
    assert_difference('Subdomain.count', -1) do
      delete :destroy, :id => @subdomain.to_param
    end

    assert_redirected_to subdomains_path
  end
end
