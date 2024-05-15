EMPTY_LINE = ' '

class Pet
  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
    puts "a #{animal} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(animal, name)
    pets << [animal, name]
  end

  def number_of_pets
    pets.count
  end
end

class Shelter
  attr_reader :adopted, :adoptable

  def initialize
    @adopted = {}
    @adoptable = []
  end

  def existing_client?(client_name)
    adopted.key?(client_name.name)
  end

  def adopt(owner_name, pet_name)
    owner_name.add_pet(pet_name.animal, pet_name.name)
    adopted[owner_name.name] = [] unless existing_client?(owner_name)
    adopted[owner_name.name] << [pet_name.animal, pet_name.name]
  end

  def add_adoptable_pet(pet)
    adoptable << [pet.animal, pet.name]
  end

  def print_adoptions
    adopted.each do |client, pets|
      puts "#{client} has adopted the following pets:"
      pets.each { |pet_array| puts pet_array[1] }
      puts EMPTY_LINE
    end
  end

  def print_adoptable_pets
    puts 'The Animal Shelter has the following unadopted pets:'
    adoptable.each { |pet_array| puts pet_array[1] }
    puts EMPTY_LINE
  end

  def number_of_pets
    adoptable.count
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

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

shelter.add_adoptable_pet(asta)
shelter.add_adoptable_pet(laddie)
shelter.add_adoptable_pet(fluffy)
shelter.add_adoptable_pet(kat)
shelter.add_adoptable_pet(ben)
shelter.add_adoptable_pet(chatterbox)
shelter.add_adoptable_pet(bluebell)

shelter.print_adoptable_pets
shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "The Animal shelter has #{shelter.number_of_pets} unadopted pets."
