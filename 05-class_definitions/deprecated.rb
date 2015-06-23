# The `Book` class in the Bookworm source coe has methods named `GetTitle`,
# `title2`, and `LEND_TO_USER`. By Ruby's conventions, these methods should be
# named `title, `subtitle`, and `lend_to`. How to rename those methods without
# breaking the callers? Use a _Class Macro_!

class Book
  def title
    # get the title from the db
  end

  def subtitle
    # get the subtitle
  end

  def lend_to(user)
    puts "Lending to #{user}"
    # ...
  end

  def self.deprecate(old_method, new_method)
    define_method(old_method) do |*args, &block|
      warn "Warning: #{old_method}() is deprecated. Use #{new_method}()."
      send(new_method, *args, &block)
    end
  end

  deprecate :GetTitle, :title
  deprecate :LEND_TO_USER, :lend_to
  deprecate :title2, :subtitle
end

b = Book.new
b.LEND_TO_USER("Bill")
