require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Biblioteca"
  end

  test "should get root page success (200:OK) " do
    get root_url
    assert_response :success
  end
 
  test "should get home page title" do
    get static_pages_home_url
    assert_response :success
    assert_select "title"
  end

  test "should get help page title" do
    get help_path
    assert_response :success
    assert_select "title", "Ayuda | #{@base_title}"
  end

  test "should get about page title" do
    get about_path
    assert_response :success
    assert_select "title", "Nosotros | #{@base_title}"
 end

  test "should get contact page title" do
    get contact_path
    assert_response :success
    assert_select "title", "Contacto | #{@base_title}"
 end

end
