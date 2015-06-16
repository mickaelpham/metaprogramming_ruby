module Printable
  def print
    'Printable#print'
  end

  def prepare_cover
    'Printable#prepare_cover'
  end
end

module Document
  def print_to_screen
    'Document#print_to_screen'
    prepare_cover
    format_for_screen
    print
  end

  def format_for_screen
    'Document#format_for_screen'
  end

  def print
    'Document#print'
  end
end

class Book
  include Printable
  include Document
end
