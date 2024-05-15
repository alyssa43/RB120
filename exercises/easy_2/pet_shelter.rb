class Pet
  def initialize(animal, name)
    @animal = animal
    @name = name
  end
end

class Owner
  def initialize(name)
    @name = name
  end

  def adopted_pets

end

class Shelter
  def initialize
    @adopted = Hash.new 
  end

  def adopt(owner_name, pet_name)
    
  end
  
  def print_adoptions
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets." # => P Hanson has 3 adopted pets.
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets." # => B Holmes has 4 adopted pets.