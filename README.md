# Attribute Accessor Macros

## Learning Goals

- Define what a macro is
- Use macros to abstract away the explicitly defined setter and getter methods in a Ruby class

## What is a Macro?

Normally when you write a method you are manipulating and returning some kind of
data.  This (kind of useless) method takes an integer and returns an integer:

```ruby
def plus_three(num)
  num + 3
end
```

By the same token, Ruby's `#map` method is called on an enumerable and returns
an array:

```ruby
mantra = ["Don't", "Repeat", "Yourself"]

mantra.map do |word|
  word[0]
end

# => ["D", "R", "Y"] 
```

In Ruby a macro is similar to a method; it's just some code that, instead of
returning a Ruby datatype, returns more Ruby code! When you run your program,
this code will get executed along with all the other code you have written. In
this lesson we will learn how to use macros to write the definitions of other
methods — crazy!

The implementation of macros is considered metaprogramming — the writing of
programs that operate on other programs. Metaprogramming can make our lives
easier by automating repetitive tasks or providing something like a
mini-language inside of another programming language that has the benefits of
being concise and descriptive. Metaprogramming is a powerful tool, but one of
the dangers of using it is that it can result in very hard to follow code that
obscures what is actually happening.

If this sounds complicated, the answer is it can be — though it doesn't need to
be. Below we'll implement some simple macros to abstract away the manual,
explicit definition of setter and getter methods in a Ruby class.

## Attribute Readers and Writers

In object-oriented Ruby, there is a strong convention to have both a setter and a
getter method that pertain to the same attribute. For example, a `.name` getter
and a `.name=` setter on our Person class. Because this pattern is so common, we
find ourselves making these manual setter and getter definitions again and
again. As Rubyists, we are lazy, and this is a virtue. If we can achieve the
same result with less code, we'll do it.

Check out the example below:

```ruby
class Person

  attr_reader :name
  attr_writer :name

end
```

The `attr_reader` macro, followed by the attribute name `:name`, *created a
getter method for us*.

The `attr_writer` macro, followed by the attribute name `:name`, *created a
setter method for us*.

We can now do the following, without explicitly defining a `.name` or `.name=`
method ourselves:

```ruby
jay_z = Person.new
jay_z.name = "Shawn Carter"
jay_z.name
  => "Shawn Carter"
```

Let's compare a `Person` class that uses macros to one that uses explicit setter
and getter methods:

Using macros:

```ruby
class Person
  attr_writer :name
  attr_reader :name

end
```

Using explicit method definitions:

```ruby
class Person

  def name=(name)
    @name = name
  end

  def name
    @name
  end
end
```

## Attribute Accessors

If we need to have both a getter and a setter method for an attribute on our
`Person` class (which isn't always the case — we'll learn more about that later),
we can use another macro called an attribute accessor.

So this code...

```ruby
class Person
  attr_writer :name
  attr_reader :name

end
```

...can now be written like this:

```ruby
class Person
  attr_accessor :name

end
```

We now have access to reader and writer methods from one macro!

## Using Macros is Usually Better

In most cases, the usage of macros is preferred over the explicit definition of
setter and getter methods. To understand why, simply look at the code above.
Which class would you rather write? The longer one, or the shorter one?
Furthermore, seeing these macros at the top of your Class definition allows you
to get a high level overview of the class right from the start: you can
immediately see what attributes the `Class` defines, and which ones have getter
and/or setter methods, without having to scroll down through the code.

While you should be using these macros in most cases, the one exception is if we
need to customize the implementation of a getter or setter method. Let's
consider our `Person` example:

```ruby
class Person
  attr_accessor :name

end

jay_z = Person.new
jay_z.name = "Shawn Carter"
jay_z.name
  => "Shawn Carter"
```

Let's say that instead of storing the full name in a single `name` variable, we
decided we want to store the first and last name separately. We could simply
replace our `attr_accessor` for `name` with `attr_accessor`s for `first_name`
and `last_name`, but then we'd need to set two separate attributes when we
create a new instance of the `Person` class. To get around this, we can create a
custom setter method that will enable us to continue passing the full name
when we create an instance, but will store the first and last name as separate
attributes:

```ruby
  def name=(full_name)
    first_name, last_name = full_name.split
    @first_name = first_name
    @last_name = last_name
  end
```

With this code, we assign a name to an instance in the usual way, passing in the
full name as the argument. Our custom setter method splits the full name into
the first and last names and assigns them to the corresponding instance variables.

We can also create a custom getter method for `name` that will return the full
name even though it is no longer stored in an instance variable:

```ruby
  def name
    "#{@first_name} #{@last_name}".strip
  end
```

Putting it all together:

```ruby
class Person
  attr_reader :first_name, :last_name

  def name=(full_name)
    first_name, last_name = full_name.split
    @first_name = first_name
    @last_name = last_name
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

end

jay_z = Person.new
jay_z.name = "Shawn Carter"

jay_z.first_name 
  #=> "Shawn"

jay_z.last_name 
  #=> "Carter"

jay_z.name
  => "Shawn Carter"
```

With our custom setter and getter, we can still assign and return the full name,
just as before. Furthermore, by adding the `attr_reader`s for `first_name` and
`last_name`, we can also access the first and last names separately.

## Lab

![Image by Dominic Albers from Pixabay](https://curriculum-content.s3.amazonaws.com/module-1/ruby-oo-fundamentals/attribute-accessors-lab/Image_137_CatInaBox%28B%29.jpg)

Run the test suite to get started. You'll be writing your code in the
`lib/meowing_cat.rb` file.

1. Define a class, called Cat.
2. Use the `attr_accessor` macro to create a setter and getter method for a
   cat's name.
3. Write a method, `.meow`, that outputs "meow!" to the terminal using the
   `puts` method when called on an instance of Cat.
