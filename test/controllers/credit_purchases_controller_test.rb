require 'test_helper'

class CreditPurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_purchase = credit_purchases(:one)
  end

  test "should get index" do
    get credit_purchases_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_purchase_url
    assert_response :success
  end

  test "should create credit_purchase" do
    assert_difference('CreditPurchase.count') do
      post credit_purchases_url, params: { credit_purchase: { amount: @credit_purchase.amount, creditor_name: @credit_purchase.creditor_name, image: @credit_purchase.image, stock_description: @credit_purchase.stock_description, user_id: @credit_purchase.user_id } }
    end

    assert_redirected_to credit_purchase_url(CreditPurchase.last)
  end

  test "should show credit_purchase" do
    get credit_purchase_url(@credit_purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_purchase_url(@credit_purchase)
    assert_response :success
  end

  test "should update credit_purchase" do
    patch credit_purchase_url(@credit_purchase), params: { credit_purchase: { amount: @credit_purchase.amount, creditor_name: @credit_purchase.creditor_name, image: @credit_purchase.image, stock_description: @credit_purchase.stock_description, user_id: @credit_purchase.user_id } }
    assert_redirected_to credit_purchase_url(@credit_purchase)
  end

  test "should destroy credit_purchase" do
    assert_difference('CreditPurchase.count', -1) do
      delete credit_purchase_url(@credit_purchase)
    end

    assert_redirected_to credit_purchases_url
  end
end
