# Meowing Cat

## Objectives

1. Practice defining a class
2. Use macros to create setter and getter methods

![maru in a box](http://readme-pics.s3.amazonaws.com/tumblr_lm841mjEdz1qibxp4o1_500.jpg)

## Introduction

In this lab, you'll be creating a Cat class. Every instance of a Cat should have
a name and be able to meow. In other words, I should be able to do:

```ruby
maru = Cat.new
maru.name = "Maru"

maru.name
# => "Maru"

maru.meow
# => "meow!"
```

## Instructions

Run the test suite to get started. You'll be writing all your code in the `lib/cat.rb` file.

1. Define a class, called Cat. 
2. Use the `attr_accessor` macro to create a setter and getter method for a cat's name.
4. Write a method, `.meow`, that outputs "meow!" to the terminal using the `puts` method when called on an instance of Cat. 

### Bonus

Everyone knows that cats (especially Maru) love to get in boxes. In upcoming lessons, we'll learn all about the interaction between instances of different Ruby classes. For now, however, if you're looking for a challenge, you can work your way through the instructions below. This is a bonus exercise, so there are no tests. Feel free to write your own though!

You'll build a class, Box, that interacts with the Cat class. A cat should be able to get in a box if the box is of a greater or equal size to the cat. For the purpose of simplicity, we'll size cats and boxes on a scale of 1 to 3. In this case, box instances will interact with cat instances in the following manner: 

```ruby
maru = Cat.new
maru.size = 2

fedex_box = Box.new
fedex_box.size = 3

maru.get_in_box(fedex_box)
  => "Meow! I'm in the box!"
```

As you can see, the `.get_in_box` instance method on cat takes in an argument of a an *instance of the box class*. 

Let's get started: 

1. In the `lib` directory, make a file called `box.rb`. 
2. In `lib/box.rb`, define your Box class. 
3. Create an `attr_accessor` in the Box class for size. 
4. In the Cat class, make an `attr_accessor` for size. 
5. In the Cat class, write a `get_in_box` instance method that takes in an argument of an instance of the Box class and checks to see if the cat is smaller than or equal to the box in size. If it is, the method should `puts` `"Meow! I'm in box"`, else, the method should `puts` `"Sad meow, I'm not in box"`. 

**Top Tip:** Inside an instance method, you can access the instance of that you are operating on by using the `self` keyword. So, if we need to check the size of the cat instance inside our `get_in_box` method, we can use the `self.size` syntax. 

#### Running Our Code

Let's see what happens when we actually make cats and boxes and try to get our cat to jump into the box!

* At the top of the `lib/meowing_cat.rb` file, require the file that contains our Box class: `require_relative './box.rb'`. 
* At the bottom of that same file, *outside of your class definition*, place the following code: 

```ruby
maru = Cat.new
maru.size = 2

fedex_box = Box.new
fedex_box.size = 3

maru.get_in_box(fedex_box)
```
* Now, in your terminal in the directory of this project, type `ruby lib/meowing_cat.rb`. You should see the following in your terminal:

```bash
"Meow! I'm in the box!"
```





