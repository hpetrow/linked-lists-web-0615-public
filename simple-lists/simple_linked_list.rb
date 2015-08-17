class Element
  attr_reader :datum, :next, :previous

  def initialize(datum, nxt)
    @datum = datum
    self.next = nxt
  end

  def next=(elt)
    @next = elt
    if (elt && elt.previous != self)
      elt.previous = self
    end
  end

  def previous=(elt)
    @previous = elt
    if (elt && elt.next != self)
      elt.next = self
    end
  end

  def to_a
    self.class.to_a(self)
  end

  def reverse
    current = self
    elt = Element.new(self.datum, nil)
    while current.next
      current = current.next
      elt = Element.new(current.datum, elt)
    end
    elt
  end

  def self.to_a(node)
    arr = []
    current = node
    while current
      arr << current.datum
      current = current.next
    end
    arr
  end

  def self.from_a(arr)
    arr = arr.to_a
    if arr.length > 0
      last = Element.new(arr.pop, nil)
      arr.reverse_each { |elt|
        last = Element.new(elt, last)
      }
      last
    else
      nil
    end
  end
end
