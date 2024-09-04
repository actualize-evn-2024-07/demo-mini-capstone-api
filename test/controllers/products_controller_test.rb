require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", params: { name: "lake", price: 800, description: "it's nice", image_url: "http:/a;sdifjpasldfjhkl;asdjf" }
      assert_response 200
    end
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "description", "image_url", "created_at", "updated_at"], data.keys
  end

  test "update" do
    product = Product.first
    patch "/product/#{product.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end
end



# What is the point of tests? this seems like more work when i can just run it in httpie
# 
# you need to test before you put something live
# 
#lots of data/routes/your app is really complicated
#backstop for sloppy people