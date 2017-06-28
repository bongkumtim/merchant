require 'test_helper'

class CashPurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_purchase = cash_purchases(:one)
  end

  test "should get index" do
    get cash_purchases_url
    assert_response :success
  end

  test "should get new" do
    get new_cash_purchase_url
    assert_response :success
  end

  test "should create cash_purchase" do
    assert_difference('CashPurchase.count') do
      post cash_purchases_url, params: { cash_purchase: { amount: @cash_purchase.amount, credit_cash_current_asset: @cash_purchase.credit_cash_current_asset, debit_purchase_cost_of_sales: @cash_purchase.debit_purchase_cost_of_sales, image: @cash_purchase.image, stock_description: @cash_purchase.stock_description, user_id: @cash_purchase.user_id } }
    end

    assert_redirected_to cash_purchase_url(CashPurchase.last)
  end

  test "should show cash_purchase" do
    get cash_purchase_url(@cash_purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_cash_purchase_url(@cash_purchase)
    assert_response :success
  end

  test "should update cash_purchase" do
    patch cash_purchase_url(@cash_purchase), params: { cash_purchase: { amount: @cash_purchase.amount, credit_cash_current_asset: @cash_purchase.credit_cash_current_asset, debit_purchase_cost_of_sales: @cash_purchase.debit_purchase_cost_of_sales, image: @cash_purchase.image, stock_description: @cash_purchase.stock_description, user_id: @cash_purchase.user_id } }
    assert_redirected_to cash_purchase_url(@cash_purchase)
  end

  test "should destroy cash_purchase" do
    assert_difference('CashPurchase.count', -1) do
      delete cash_purchase_url(@cash_purchase)
    end

    assert_redirected_to cash_purchases_url
  end
end
