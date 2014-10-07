class SquareRootConvergent

  @@fraction_map = Hash.new

  class Fraction
    attr_accessor :numerator, :denominator

    def initialize(n, d)
      @numerator = n
      @denominator = d
    end
    def to_s
      @numerator.to_s + ' / ' + @denominator.to_s
    end

    def diff
      @numerator.to_s.length - @denominator.to_s.length
    end
  end

  def self.fractions(n)

    if n == 1 then Fraction.new(3, 2)
    else
      if @@fraction_map.has_key?(n)
        @@fraction_map[n]
      else
        f = fractions(n - 1)
        num = f.numerator
        d = f.denominator
        @@fraction_map[n] = Fraction.new((2 * d + num), (d + num))
        @@fraction_map[n]
      end
    end
  end

  puts((1..gets.to_i).map { |i| [i, fractions(i)] }.find_all { |f| f[1].diff > 0 }.map { |f| f[0] })
end