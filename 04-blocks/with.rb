# My attempt
module Kernel
  def with(resource)
    yield resource if block_given?
    ensure
      resource.dispose
  end
end

# The book solution
module Kernel
  def with(resource)
    begin
      yield
    ensure
      resource.dispose
    end
  end
end
