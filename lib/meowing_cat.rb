## code your solution here. 
class Cat

  attr_accessor :name

  def meow=(meow)
      @meow = meow
    puts "meow!"
  end

end

bernie = Cat.new
bernie.name = "Bernie"

bernie.meow 