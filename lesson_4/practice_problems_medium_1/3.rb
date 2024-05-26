# In the lst question Alan showed Alyssa this code which keeps track of items from a shopping cart application:

class InvoiceEntry
  attr_accessor :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# Alyssa noticed that htis will fail when `update_quantity` is called. Since `quantity` is an instance variable, it must be accessed with the `@quantity` notation when setting it. One way to fix this is to change `attr_reader` to `attr_accessor` and change `quantity` to `self.quantity`. 

# Is there anything wrong with fixing it this way?

# Answer =>
# By changing `attr_reader` to `attr_accessor`, it does lead to the possibility of the instance varaible `quantity` to be modified from outside of the class because it is creating the setter method `quantity=` which means that if someone did this:

cart = InvoiceEntry.new("Apple", 4)
cart.quantity # => 4

cart.quantity = 100
cart.quantity # => 100

# The instance variable will be modified, and therefore is not protected. We might not want the possibility of this instance variable to be modified from outside of the `InvoiceEntry` class. 