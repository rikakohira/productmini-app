class Form::ProductCollection
  include ActiveModel::Model
  include ActiveModel::Callbacks
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  
  #作成したい登録フォームの数を指定
  FORM_COUNT = 10 
  #クラス外部からproductsへのアクセスが可能
  attr_accessor :products 

  def initialize(attributes = {})
    super attributes
    #mapは返り値で配列を作る
    self.products = FORM_COUNT.times.map { Product.new() } unless self.products.present?
  end

  #コントローラからストロングパラメータを受け取る
  def products_attributes=(attributes)
    self.products = attributes.map { |_, v| Product.new(v) }
  end

  def save
    #transactionでデータベース内の情報の整合性を保つ
    Product.transaction do
      self.products.map do |product|
        #チェックボックスにチェックを入れている商品のみが保存される
        if product.availability 
          product.save
        end
      end
    end
      return true
    rescue => e
      return false
  end
end