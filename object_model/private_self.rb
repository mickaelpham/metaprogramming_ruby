# You can make this code work by removing the `self` keyword.
class C
  def public_method
    self.private_method
  end

  private

  def private_method; end
end

C.new.public_method # => NoMethodError: private method 'private_method' called

# Can an object `x` call a private method on object `y` if the two objects share
# the same class?
class D
  def public_method(receiver)
    receiver.private_method
  end

  private

  def private_method; end
end

d1 = D.new
d2 = D.new

d1.public_method(d2) # => NoMethodError: private method 'private_method' called

# Can you call a `private` method that you inherited from a superclass?
class E
  private

  def private_method
    'E#private_method'
  end
end

class E1 < E
  def public_method
    private_method
  end
end

E.new.public_method # Yep!
