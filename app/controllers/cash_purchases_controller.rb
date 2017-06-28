class CashPurchasesController < ApplicationController
  before_action :set_cash_purchase, only: [:show, :edit, :update, :destroy]

  def index
    @cash_purchases = CashPurchase.all
  end


  def show
  end

  def new
    @cash_purchase = current_user.cash_purchase.build
  end

  def edit
  end


  def create
    @cash_purchase = current_user.cash_purchase.build(cash_purchase_params)

    respond_to do |format|
      if @cash_purchase.save
        format.html { redirect_to @cash_purchase, notice: 'Cash purchase was successfully created.' }
        format.json { render :show, status: :created, location: @cash_purchase }
      else
        format.html { render :new }
        format.json { render json: @cash_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cash_purchase.update(cash_purchase_params)
        format.html { redirect_to @cash_purchase, notice: 'Cash purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @cash_purchase }
      else
        format.html { render :edit }
        format.json { render json: @cash_purchase.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @cash_purchase.destroy
    respond_to do |format|
      format.html { redirect_to cash_purchases_url, notice: 'Cash purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_cash_purchase
      @cash_purchase = CashPurchase.find(params[:id])
    end


    def cash_purchase_params
      params.require(:cash_purchase).permit(:stock_description, :user_id, :image, :amount, :debit_purchase_cost_of_sales, :credit_cash_current_asset)
    end
end
