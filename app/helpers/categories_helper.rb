module CategoriesHelper
  def is_product_category?(id)
    category = Category.find(id)
    category.name == "product"
  end
end
