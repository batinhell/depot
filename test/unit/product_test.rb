require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  fixtures :products

  test "product attributes must not be empty" do
      product = Product.new
      assert product.invalid?
      assert product.errors[:title].any?
      assert product.errors[:description].any?
      assert product.errors[:price].any?
      assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
      product = Product.new(title:       "My Book Title",
                            description: "yyy",
                            image_url:   "zzz.jpg")
      product.price = -1
      assert product.invalid?
      assert_equal "может иметь лишь значение большее или равное 0.01", 
      product.errors[:price].join('; ')

      product.price = 0
      assert product.invalid?
      assert_equal "может иметь лишь значение большее или равное 0.01", 
      product.errors[:price].join('; ')

      product.price = 1
      assert product.valid?
  end

  test "product is not valid without unique title" do
      product = Product.new(title: products(:ruby).title,
          description: "qwe",
          image_url: "qwe.jpg",
          price: 32.98
      )
      assert !product.save
      assert_equal "уже существует", product.errors[:title].join('; ')
  end

  test "product title must be at least 5 characters" do 
    product = Product.new(price: 2,
                          description: "yyy",
                          image_url: "zzz.jpg")
    product.title = "Ruby"
    assert product.invalid?
    assert_equal "more then 5 if you don't mind",
    product.errors[:title].join('; ')

    product.title = "Ruby language"
    assert product.valid?
  end

end
