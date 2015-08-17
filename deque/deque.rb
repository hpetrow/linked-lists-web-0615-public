require_relative '../simple-lists/simple_linked_list'

class Deque
  attr_accessor :list

  def initialize
    @list = nil
  end

  def push(datum)
    if !self.list
      self.list = Element.new(datum, nil)
    elsif !self.list.next
      self.list.next = Element.new(datum, self.list)
    else
      self.list.previous.next = Element.new(datum, self.list)
    end
  end

  def pop
    if self.list.previous
      elt = self.list.previous
      self.list.previous = self.list.previous.previous
    else
      elt = self.list
      self.list = nil
    end
    elt.datum
  end

  def shift
    if self.list
      if self.list.next
        if self.list.next != self.list.previous
          self.list.next.previous = self.list.previous
        else
          self.list.next.next = nil
        end
      end
      result = self.list.datum
      self.list = self.list.next
      result
    end
  end

  def unshift(datum)
    elt = Element.new(datum, nil)
    if self.list && self.list.previous
      elt.previous = self.list.previous
    else
      elt.previous = self.list
    end
    elt.next = self.list
    self.list = elt
  end
end
