class ProductsController < ApplicationController
  def new
    #コレクションモデルのインスタンスを生成
    @form = Form::ProductCollection.new
  end

  def create
    @form = Form::ProductCollection.new(product_collection_params)
    if @form.save
      redirect_to products_path, notice: "商品を登録しました"
    else
      flash.now[:alert] = "商品登録に失敗しました"
      render :new
    end

  end

  private

    def product_collection_params
        params.require(:form_product_collection)
        .permit(products_attributes: [:name, :price, :unit, :availability])
    end
  
end
