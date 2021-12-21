require 'pry'

class Cat
    attr_accessor :name

    def cat(name)
        @name = name
    end

    def meow
        puts "meow!"
    end
end


