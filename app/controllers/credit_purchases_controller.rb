class CreditPurchasesController < ApplicationController
  before_action :set_credit_purchase, only: [:show, :edit, :update, :destroy]


  def index
    @credit_purchases = CreditPurchase.all
  end


  def show
  end


  def new
    @credit_purchase = current_user.credit_purchase.build
  end


  def edit
  end


  def create
    @credit_purchase = current_user.credit_purchase.build(credit_purchase_params)

    respond_to do |format|
      if @credit_purchase.save
        format.html { redirect_to @credit_purchase, notice: 'Credit purchase was successfully created.' }
        format.json { render :show, status: :created, location: @credit_purchase }
      else
        format.html { render :new }
        format.json { render json: @credit_purchase.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @credit_purchase.update(credit_purchase_params)
        format.html { redirect_to @credit_purchase, notice: 'Credit purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_purchase }
      else
        format.html { render :edit }
        format.json { render json: @credit_purchase.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @credit_purchase.destroy
    respond_to do |format|
      format.html { redirect_to credit_purchases_url, notice: 'Credit purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_credit_purchase
      @credit_purchase = CreditPurchase.find(params[:id])
    end


    def credit_purchase_params
      params.require(:credit_purchase).permit(:stock_description, :creditor_name, :user_id, :amount, :image)
    end
end
