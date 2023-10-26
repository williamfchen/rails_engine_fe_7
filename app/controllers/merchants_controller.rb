class MerchantsController < ApplicationController
  def index
    @merchants = MerchantsFacade.new.merchants
  end

  def show
    @merchant = MerchantsFacade.new.merchant(params[:id])
    @items = MerchantsFacade.new.merchant_items(params[:id])
  end
end
