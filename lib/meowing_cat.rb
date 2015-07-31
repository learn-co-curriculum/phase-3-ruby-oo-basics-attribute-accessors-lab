require_relative './box.rb'

class Cat
  attr_accessor :name, :size

  def meow
    puts "meow!"
  end

  #bonus


  # def assess_box(box)
  #   true if self.size <= box.size
  # end

  # def jump
  #   puts "Meow! I'm in the box!"
  # end

  # def get_in_box(box)
  #   if assess_box(box)
  #     jump
  #   else
  #     meow.upcase
  #   end
  # end

end


# bonus implementation

# maru = Cat.new
# maru.size = 2
# box = Box.new
# box.size = 3

# maru.get_in_box(box)
