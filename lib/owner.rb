class Owner
  attr_reader :name, :species, :cats, :dogs

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @cats = []
    @dogs = []
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select { |x|  x.owner == self  }
  end

  def dogs
    Dog.all.select{|x| x.owner == self}
  end

  def buy_cat(name)
    name = Cat.new(name,self)
  end

  def buy_dog(name)
    name = Dog.new(name,self)
  end

  def walk_dogs
    Owner.dogs.mood = "happy"
  end

end
