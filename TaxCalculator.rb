class TaxCalculator
  attr_reader :percent

  def initialize percent
    @percent = percent
  end

  def net_amount(*args)
    first = args[0]
    total = first
    rest = args[1 .. -1]
    for i in rest
      if i.second != total.second
        raise Incalculable
      end
    end
    for pair in rest
      total = Pair.new(total.first + pair.first, pair.second)
    end
    amount = total.first * (@percent / 100.0)
    tax = Pair.new amount, first.second
    if total.second == tax.second
      Pair.new total.first - tax.first, first.second
    else
      raise Incalculable
    end
  end
end

class Pair
  attr_accessor :first, :second

  def initialize first, second
    @first = first
    @second = second
  end
end

class Incalculable < Exception
end