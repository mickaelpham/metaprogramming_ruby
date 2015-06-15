module M
  class C
    X = 'a constant'
  end
  C::X # => "a constant"
end

M::C::X # => "a constant"
