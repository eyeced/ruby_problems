module RubyProblems
  module Arithmetic

    include RubyProblems::PrologList

    # 2.01 is prime
    def self.is_prime?(num)
      return true if num == 2 or num == 3
      return false if num % 2 == 0
      i = 1
      sq = Math.sqrt(num)
      while i < sq do
        i += 2
        return false if num % i == 0
      end
      true
    end

    # 2.02 prime factors
    def self.prime_factors(num)
      pf(num, 2)
    end

    # 2.03 get prime factors and collect them with there number of occurances
    def self.prime_factors_multi(num)
      encode(prime_factors(num))
    end

    # 2.04 get prime numbers below the given number
    def self.all_primes(num)
      primes((2..num).to_a)
    end

    private
    def self.pf(num, start)
      a = nil
      (start..(Math.sqrt(num))).each do |p|
        a = p if (num % p == 0 and is_prime? p)
        break if !a.nil?
      end
      a.nil? ? [num] : ([a] + pf(num / a, a))
    end

    def self.primes(nums)
      return (is_prime?(nums.first) ? nums : []) if nums.size == 1
      head, *tail = nums
      [head] + primes(tail.select {|x| x % head != 0})
    end
  end
end
