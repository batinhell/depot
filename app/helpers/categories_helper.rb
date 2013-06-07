module CategoriesHelper
  def cat
    @main = Category.where(:parent_id => 0) 
  end
end
