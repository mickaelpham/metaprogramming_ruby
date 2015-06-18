class MyClass
  def first_method
    'MyClass#first_method'
  end

  def second_method
    'MyClass#second_method'
  end

  def third_method
    'MyClass#third_method'
  end

  def self.fourth_method
    'MyClass::fourth_method'
  end

  def self.hide(name)
    undef_method name
  end

  # Hide absolutely every methods!
  instance_methods.each { |m| hide(m) }
end
