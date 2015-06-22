str = "just a regular string"

def str.title?
  self.upcase == self
end

str.title?                  # => false
str.methods.grep(/title?/)  # => [:title?]
str.singleton_methods       # => [:title?]
