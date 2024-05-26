# Alan created the following code to keep track of items for a shopping cart application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Alyssa looked at the code and spotted a mistake. "This will fail when `update_quantity` is called", she says.

# Can you spot the mistake and how to address it?

# Answer =>
# The mistake here is that we do not have a setter method for the instance variable `@quantity`. Because we used `attr_reader` we only have a getter method for `@quantity`, so when we try to reassign `quantity = updated_count`, we are actually creating a new local variable within the `update_quantity` method, which is not what we want to do. To fix this we need to change `attr_reader :quantity` to `attr_accessor :quantity` and change the `update_quantity` method to:
# `self.quantity = updated_count if updated_count >= 0`

# Or we can access the instance variable itself by prefacing `quantity` with an `@` symbol like this: 
# `@quantity = updated_count if updated_count >= 0` 

# NOTE: To disambiguate from creating a local variable, we need to use `self.name =` to let Ruby know that we're calling a method.